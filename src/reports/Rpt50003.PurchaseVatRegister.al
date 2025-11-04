report 50003 "Purchase VAT Register Excel"
{
    Caption = 'Purchase Register VAT Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true; // No built-in layout

    dataset
    {
        dataitem(PurchaseInvoiceHeader; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Posting Date";

            dataitem(PurchaseInvoiceLine; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where(Type = filter(<> ''));

                trigger OnAfterGetRecord()
                var
                    VATAmount: Decimal;
                begin
                    VATAmount := GetLineVATAmount("Document No.", "Line No.");

                    // Write data into Excel buffer
                    ExcelBuffer.AddColumn("No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Posting Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                    ExcelBuffer.AddColumn("Order No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Shortcut Dimension 1 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(GetUnitDescription("Shortcut Dimension 1 Code"), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Shortcut Dimension 2 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(GetDepartmentDescription("Shortcut Dimension 2 Code"), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Buy-from Vendor No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn("Buy-from Vendor Name", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    //ExcelBuffer.AddColumn("", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn("Line Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(VATAmount, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn("Amount Including VAT", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);

                    ExcelBuffer.NewRow();
                end;
            }

            trigger OnPreDataItem()
            begin
                if (FromDate <> 0D) and (ToDate <> 0D) then
                    PurchaseInvoiceHeader.SetRange("Posting Date", FromDate, ToDate);
            end;

            trigger OnAfterGetRecord()
            begin
                if FirstHeaderRowAdded = false then begin
                    AddExcelHeader();
                    FirstHeaderRowAdded := true;
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filter)
                {
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = All;
                        Caption = 'To Date';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            FromDate := CalcDate('<-1M>', Today);
            ToDate := Today;
        end;
    }

    trigger OnPostReport()
    begin
        ExcelBuffer.CreateNewBook('Purchase Register VAT Report');
        ExcelBuffer.WriteSheet('Purchase VAT', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();
    end;

    var
        FromDate: Date;
        ToDate: Date;
        ExcelBuffer: Record "Excel Buffer" temporary;
        PurchaseInvoiceLine2: Record "Purch. Inv. Line";
        DimensionValue: Record "Dimension Value";
        FirstHeaderRowAdded: Boolean;

    local procedure AddExcelHeader()
    begin
        ExcelBuffer.AddColumn('Bill No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Bill Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Order No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Unit Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Unit Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Department Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Department Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Vendor Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Vendor Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        //ExcelBuffer.AddColumn('Pay-to Address', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Item Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Quantity', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Line Amount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('VAT Amount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Total Amount (Incl. VAT)', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
    end;

    local procedure GetLineVATAmount(DocNo: Code[20]; LineNo: Integer): Decimal
    var
        VATAmt: Decimal;
    begin
        PurchaseInvoiceLine2.Reset();
        PurchaseInvoiceLine2.SetRange("Document No.", DocNo);
        PurchaseInvoiceLine2.SetRange("Line No.", LineNo);
        if PurchaseInvoiceLine2.FindFirst() then
            VATAmt := PurchaseInvoiceLine2."Amount Including VAT" - PurchaseInvoiceLine2."Line Amount";
        exit(Abs(VATAmt));
    end;

    local procedure GetDepartmentDescription(DeptCode: Code[20]): Text
    begin
        if DeptCode = '' then
            exit('');
        DimensionValue.Reset();
        DimensionValue.SetRange("Dimension Code", 'DEPARTMENT');
        DimensionValue.SetRange(Code, DeptCode);
        if DimensionValue.FindFirst() then
            exit(DimensionValue.Name);
    end;

    local procedure GetUnitDescription(UnitCode: Code[20]): Text
    begin
        if UnitCode = '' then
            exit('');
        DimensionValue.Reset();
        DimensionValue.SetRange("Dimension Code", 'UNIT');
        DimensionValue.SetRange(Code, UnitCode);
        if DimensionValue.FindFirst() then
            exit(DimensionValue.Name);
    end;
}