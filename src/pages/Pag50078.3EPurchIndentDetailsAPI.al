page 50078 "3E Purchase Indent Details API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'indentPurchaseDetailAPI';
    DelayedInsert = true;
    EntityName = 'indentPurchsaseDetail';
    EntitySetName = 'indentPurchaseDetails';
    PageType = API;
    SourceTable = "3E HIS Indent Header";
    ODataKeyFields = SystemId;
    Extensible = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field(recordType; Rec."Record Type")
                // {
                //     Caption = 'Record Type';
                // }
                // field(documentType; Rec."Document Type")
                // {
                //     Caption = 'Document Type';
                // }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';

                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(hisDocumentType; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(vendorCustomerNo; Rec."Vendor/Customer No.")
                {
                    Caption = 'Vendor/Customer No.';
                }
                field(vendorCustomerName; Rec."Vendor/Customer Name")
                {
                    Caption = 'Vendor/Customer Name';
                }
                field(invoiceNo; Rec."Invoice No.")
                {
                    Caption = 'Invoice No.';
                }
                field(invoiceDate; Rec."Invoice Date")
                {
                    Caption = 'Invoice Date';
                }
                field(indentOrderNo; Rec."Indent Order No.")
                {
                    Caption = 'Indent Order No.';
                }
                field(indentOrderDate; Rec."Indent Order Date")
                {
                    Caption = 'Indent Order Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(noofLines; Rec."No. of Lines")
                {
                    Caption = 'No. of Lines';
                }
                field(vatAmount; Rec."VAT Amount")
                {
                    Caption = 'VAT Amount';
                }
                field(stationName; Rec."Station Name")
                {
                    Caption = 'Station Name';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }

            }
            part(IndentLine; "3E Purchase Indent Line API")
            {
                Caption = 'Lines';
                EntityName = 'indentPurchaseline';
                EntitySetName = 'indentPurchaselines';
                SubPageLink = "Record Type" = field("Record Type"), "Document Type" = field("Document Type"), "Document No." = field("Document No.");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Validate("Record Type", Rec."Record Type"::Purchase);
        Rec."Document Type" := Rec."Document Type"::Invoice;
        //DuplicateCheck();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Validate("Record Type", Rec."Record Type"::Purchase);
        Rec."Document Type" := Rec."Document Type"::Invoice;
        //DuplicateCheck();
    end;

    local procedure DuplicateCheck()
    var
        IndentHeader: Record "3E HIS Indent Header";
    begin
        IndentHeader.Setrange("Record Type", Rec."Record Type"::Purchase);
        IndentHeader.Setrange("Document Type", Rec."Document Type"::Invoice);
        IndentHeader.SetRange("Document No.", Rec."Document No.");
        if IndentHeader.Count >= 1 then
            error('Duplicate Entry');
    end;
}
