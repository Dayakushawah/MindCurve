page 50015 "3E HIS Item List"
{

    ApplicationArea = All;
    Caption = 'HIS Item List';
    PageType = List;
    Editable = true;
    CardPageId = 50016;

    SourceTableView = SORTING("HIS Code") WHERE(IsCreated = FILTER(false), "Party Type" = FILTER(Item));

    SourceTable = "3E HIS Master Staging";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Party Type")
                {
                    ToolTip = 'Specifies the value of the HIS Item Code field';
                    ApplicationArea = All;
                }
                field("HIS Item Code"; Rec."HIS Code")
                {
                    ToolTip = 'Specifies the value of the HIS Item Code field';
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field';
                    ApplicationArea = All;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Base Unit of Measure field';
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field';
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field';
                    ApplicationArea = All;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field';
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field';
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field';
                    ApplicationArea = All;
                }
                field("Inventory-NonInventory"; Rec."Inventory-NonInventory")
                {
                    ToolTip = 'Specifies the value of the Inventory-NonInventory Item field.';
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Description field';
                }
            }
        }
    }

}
