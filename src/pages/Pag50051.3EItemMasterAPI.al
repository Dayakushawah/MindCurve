page 50051 "3E Item Master API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'ItemMasterAPI';
    DelayedInsert = true;
    EntityName = 'itemMaster';
    EntitySetName = 'itemMasters';
    PageType = API;
    SourceTable = "3E HIS Master Staging";
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(hisCode; Rec."HIS Code")
                {
                    Caption = 'HIS Code';

                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                field(itemCode; Rec."Item ID")
                {
                    Caption = 'Item Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(itemCategoryName; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                }
                field(itemSubCategoryCode; Rec."Item Sub Category Code")
                {
                    Caption = 'Item Sub Category Code';
                }
                field(itemSubCategoryName; Rec."Item Sub Category Name")
                {
                    Caption = 'Item Sub Category Name';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(packSize; Rec."Pack Size")
                {
                    Caption = 'Pack Size';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(invPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                }
                field(globalDimenCode1; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimenCode2; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(itemtype; Rec."Inventory-NonInventory")
                {
                    Caption = 'Item Type';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Party Type" := Rec."Party Type"::Item;
        //DuplicateCheck();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Party Type" := Rec."Party Type"::Item;
    end;

    local procedure DuplicateCheck()
    var
        RevenueStaging: Record "3E HIS Master Staging";
    begin
        RevenueStaging.SetRange("Party Type", Rec."Party Type"::Item);
        RevenueStaging.SetRange("HIS Code", Rec."HIS Code");
        if not RevenueStaging.IsEmpty then
            error('Duplicate Entry');
    end;
}
