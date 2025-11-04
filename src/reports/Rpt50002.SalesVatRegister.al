report 50002 "Sales VAT Register Excel"
{
    Caption = 'Sales Register VAT Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Excel;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            column(BillNo; "No.") { Caption = 'Bill No.'; }
            column(BillDate; "Posting Date") { Caption = 'Bill Date'; }
            column(OrderNo; "Order No.") { Caption = 'Order No.'; }
            column(UnitCode; "Shortcut Dimension 1 Code") { Caption = 'Unit Code'; }
            column(DeptCode; "Shortcut Dimension 2 Code") { Caption = 'Department Code'; }
            column(TransactionType; GetDocTypeTxt()) { Caption = 'Transaction Type'; }
            column(CustomerNo; "Sell-to Customer No.") { Caption = 'Customer Code'; }
            column(CustomerName; "Sell-to Customer Name") { Caption = 'Customer Name'; }
            column(BillToAddress; "Bill-to Address") { Caption = 'Billing Address'; }
            column(BillToAddress2; "Bill-to Address 2") { Caption = 'Billing Address 2'; }
            column(City; "Bill-to City") { Caption = 'City'; }
            column(VATRegistrationNo; "VAT Registration No.") { Caption = 'VAT Registration No.'; }
            column(RegistrationNumber; "Registration Number") { Caption = 'Registration Number'; }
            column(YourReference; "Your Reference") { Caption = 'Your Reference'; }

            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where(Type = filter(<> ''));

                column(LineNo; "Line No.") { Caption = 'Line No.'; }
                column(No; "No.") { Caption = 'Item No.'; }
                column(Description; Description) { Caption = 'Item Description'; }
                column(Quantity; Quantity) { Caption = 'Quantity'; }
                column(LineAmount; "Line Amount") { Caption = 'Line Amount'; }

                // ✅ Call the function to calculate VAT per line
                column(VATAmt; GetLineVATAmount("Document No.", "Line No."))
                {
                    Caption = 'VAT Amount';
                }

                column(AmountIncludingVAT; "Amount Including VAT")
                {
                    Caption = 'Total Amount (Incl. VAT)';
                }

                column(Type; Format(Type)) { Caption = 'Type'; }
            }
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
                    field("Posting Date Filter"; "SalesInvoiceHeader"."Posting Date")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(Excel)
        {
            Type = Excel;
            LayoutFile = 'SalesRegisterNew22VATReport.xlsx';
        }
    }

    var
        SalesInvoiceLine2: Record "Sales Invoice Line";

    // ✅ Define the function in global scope (inside report, outside dataset)
    local procedure GetLineVATAmount(DocNo: Code[20]; LineNo: Integer): Decimal
    var
        VATAmt: Decimal;
    begin
        VATAmt := 0;
        SalesInvoiceLine2.Reset();
        SalesInvoiceLine2.SetRange("Document No.", DocNo);
        SalesInvoiceLine2.SetRange("Line No.", LineNo);
        if SalesInvoiceLine2.FindFirst() then
            VATAmt := SalesInvoiceLine2."Amount Including VAT" - SalesInvoiceLine2."Line Amount";

        exit(Abs(VATAmt)); // Ensures positive VAT always
    end;

    // Optional helper for transaction type (if you already had it)
    local procedure GetDocTypeTxt(): Text
    begin
        exit('Sales'); // or logic as per your existing doc type
    end;
}