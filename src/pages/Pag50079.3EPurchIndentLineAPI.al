page 50079 "3E Purchase Indent Line API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eIndentPurchaeLineAPI';
    DelayedInsert = true;
    AutoSplitKey = true;
    EntityName = 'indentPurchaseline';
    EntitySetName = 'indentPurchaselines';
    PageType = API;
    SourceTable = "3E HIS Indent Line";
    ODataKeyFields = SystemId;
    Extensible = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Documment No.';
                }
                field(itemType; Rec."Item Type")
                {
                    Caption = 'Item Type';
                }

                field(itemID; Rec."Item ID")
                {
                    Caption = 'Item ID';
                }

                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(itemName; Rec."Item Name")
                {
                    Caption = 'Item Name';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }

                field(quantity; Rec."Received Qty")
                {
                    Caption = 'Quantity';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(addOnDiscount; Rec.Discount)
                {
                    Caption = 'Add on Discount';
                }
                field(grossAmount; Rec."Gross Amount")
                {
                    Caption = 'Gross Amount';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(itemCategoryName; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                }
                field(itemSubcategoryId; Rec."Item Sub category Id")
                {
                    Caption = 'Item Sub category Id';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                }
                field(vatPer; Rec."VAT Per")
                {
                    Caption = 'VAT Per';
                }
                field(serviceCode; Rec."Service Code")
                {
                    Caption = 'Service Code';
                }
                field(batchNo; Rec.BatchNo)
                {
                    Caption = 'BatchNo';
                }
                field(expiryDate; Rec.ExpiryDate)
                {
                    Caption = 'ExpiryDate';
                }
                field(indentNo; Rec."Indent No")
                {
                    Caption = 'Indent No';
                }
                field(stationSINo; Rec."Station SI No")
                {
                    Caption = 'Station SI No';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(itemTypeCode; Rec."Item Type Code")
                {
                    Caption = 'Item Type Code';
                }
                field(itemypeName; Rec."Item Type Name")
                {
                    Caption = 'Item Type Code';
                }
                field(itemSubTypeCode; Rec."Item Sub Type Code")
                {
                    Caption = 'Item Sub Type Code';
                }
                field(itemSubTypeName; Rec."Item Sub Type Name")
                {
                    Caption = 'Item Sub Type Name';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec.HasFilter() then begin
            Rec.Validate("Record Type", Rec."Record Type"::Purchase);
            Rec."Document Type" := Rec."Document Type"::Invoice;
            Rec."Document No." := Rec.GetFilter("Document No.");
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.HasFilter() then begin
            Rec.Validate("Record Type", Rec."Record Type"::Purchase);
            Rec."Document Type" := Rec."Document Type"::Invoice;
            Rec."Document No." := Rec.GetFilter("Document No.");
        end;
    end;
}
