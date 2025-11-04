page 50011 "3E HIS MOP Revenue Setup"
{

    ApplicationArea = All;
    Caption = 'HIS MOP Revenue Setup';
    PageType = List;
    SourceTableView = SORTING("Entry No.") WHERE("Type" = FILTER(MOP));
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
                field("MOP Code"; Rec."MOP Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MOP Code field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field';
                    ApplicationArea = All;
                }
                field("GL Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the GL Account No. field';
                    ApplicationArea = All;
                }
                field("GL Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the GL Account Name field';
                    ApplicationArea = All;
                }



            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::MOP
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::MOP
    end;

}
