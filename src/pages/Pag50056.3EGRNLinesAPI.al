page 50056 "3E GRN Lines API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eGRNLinesAPI';
    DelayedInsert = true;
    AutoSplitKey = true;
    EntityName = 'grnLine';
    EntitySetName = 'grnLines';
    PageType = API;
    SourceTable = "3E HIS Purchase Line";
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(receivedQty; Rec."Received Qty")
                {
                    Caption = 'Received Qty';
                }
                field(freeQty; Rec."Free Qty")
                {
                    Caption = 'Free Qty';
                }
                field(grossAmount; Rec."Gross Amount")
                {
                    Caption = 'Gross Amount';
                }
                field(vatPer; Rec."VAT Per")
                {
                    Caption = 'VAT Per';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(discount; Rec.Discount)
                {
                    Caption = 'Discount';
                }
                field(otherCharges; Rec."Other Charges")
                {
                    Caption = 'Other Charges';
                }
                field(purchaseAccount; Rec."Purchase Account")
                {
                    Caption = 'Purchase Account';
                }
                field(hisItemType; Rec."HIS Item Type")
                {
                    Caption = 'HIS Item Type';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category';
                }
                field(itemSubCategory; Rec."Item Sub Category")
                {
                    Caption = 'Item Sub Category';
                }
                field(discountPer; Rec."Discount %")
                {
                    Caption = 'Discount %';
                }
                field(batchNo; Rec."Batch No")
                {
                    Caption = 'Batch No';
                }
                field(expiryDate; Rec."Expiry Date")
                {
                    Caption = 'Expiry Date';
                }
                field(unitOfMeasurement; Rec."Unit of Measurement")
                {
                    Caption = 'Unit of Measurement';
                }
                field(packSize; Rec."Pack Size")
                {
                    Caption = 'Pack Size';
                }
                field(itemCategoryName; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
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
            if Rec.GetFilter("Record Type") = 'GRN' then begin
                Rec.Validate("Record Type", Rec."Record Type"::GRN);
                Rec."Document Type" := Rec."Document Type"::Order;
            end else begin
                Rec.Validate("Record Type", Rec."Record Type"::"GRN Return");
                Rec."Document Type" := Rec."Document Type"::"Return Order";
            end;
            Rec."Document No." := Rec.GetFilter("Document No.");
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.HasFilter() then begin
            if Rec.GetFilter("Record Type") = 'GRN' then begin
                Rec.Validate("Record Type", Rec."Record Type"::GRN);
                Rec."Document Type" := Rec."Document Type"::Order;
            end else begin
                Rec.Validate("Record Type", Rec."Record Type"::"GRN Return");
                Rec."Document Type" := Rec."Document Type"::"Return Order";
            end;
            Rec."Document No." := Rec.GetFilter("Document No.");
        end;
    end;
}
