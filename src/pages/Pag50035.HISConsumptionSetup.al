page 50035 "3E HIS Consumption Setup"
{

    ApplicationArea = All;
    Caption = 'HIS Consumption Setup';
    PageType = List;
    SourceTableView = SORTING("Entry No.") WHERE("Type" = FILTER(Consumption));
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
                field("Service Head"; Rec."Service/Station Head")
                {
                    ToolTip = 'Specifies the value of the Service Head field';
                    ApplicationArea = All;
                }
                field("Service Head Name"; Rec."Service/Station Head Name")
                {
                    ToolTip = 'Specifies the value of the Service Head Name field';
                    ApplicationArea = All;
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
                field(Category; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Category field';
                    ApplicationArea = All;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = All;
                }

                field("Sub Category"; Rec."Sub Category Code")
                {
                    ToolTip = 'Specifies the value of the Sub Category field';
                    ApplicationArea = All;
                }

                field("Sub Category Name"; Rec."Sub Category Name")
                {
                    ToolTip = 'Specifies the value of the Sub Category field';
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Consumption
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Consumption
    end;

}
