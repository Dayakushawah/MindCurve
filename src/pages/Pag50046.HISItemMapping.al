page 50046 "3E HIS Item Mapping"
{

    ApplicationArea = All;
    Caption = 'HIS Item Mapping';
    PageType = List;
    SourceTable = "3E HIS Item Mapping";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field';
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field';
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        ItemCategory: Record "Item Category";
                    begin
                        if Rec."Item Category Code" <> '' then begin
                            ItemCategory.get(Rec."Item Category Code");
                            Rec."Item Category Description" := ItemCategory.Description;
                        end;
                    end;
                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    ToolTip = 'Specifies the value of the Item Category Description field';
                    Editable = false;
                    ApplicationArea = All;
                }
                // field("Product Group Code"; Rec."Product Group Code")
                // {
                //     ToolTip = 'Specifies the value of the Product Group Code field';
                //     ApplicationArea = All;
                // }
                // field("Product Group Description"; Rec."Product Group Description")
                // {
                //     ToolTip = 'Specifies the value of the Product Group Description field';
                //     ApplicationArea = All;
                // }

                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Account No. field';
                    ApplicationArea = All;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ToolTip = 'Specifies the value of the G/L Account Name field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
