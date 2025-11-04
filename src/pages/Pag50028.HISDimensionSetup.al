page 50028 "3E HIS Dimension Setup"
{

    ApplicationArea = All;
    Caption = 'Dimension Mapping';
    PageType = List;
    SourceTableView = SORTING("Entry No.") WHERE("Type" = FILTER(Dimension));
    SourceTable = "3E HIS GL Accounts Mapping";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field';
                    ApplicationArea = All;
                }
                field("HIS Code"; Rec."HIS Code")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the HIS Code field.';
                }
                field("HIS Name"; Rec."HIS Name")
                {
                    ToolTip = 'Specifies the value of the HIS Name field.';
                    ApplicationArea = All;
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                    ApplicationArea = All;
                }
                field("Profit Center"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
                }
                field("Dimension Value Name"; Rec."Dimension Value Name")
                {
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Dimension
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Dimension
    end;

}
