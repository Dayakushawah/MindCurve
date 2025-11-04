page 50009 "3E HIS Integration Setup Line"
{

    Caption = 'HIS Integration Setup Line';
    PageType = ListPart;
    SourceTable = "3E HIS Integration Setup Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field';
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field';
                    ApplicationArea = All;
                }
                field("General Journal Template Code"; Rec."General Journal Template Code")
                {
                    ToolTip = 'Specifies the value of the General Journal Template Code field';
                    ApplicationArea = All;
                }
                field("General Journal Batch Code"; Rec."General Journal Batch Code")
                {
                    ToolTip = 'Specifies the value of the General Journal Batch Code field';
                    ApplicationArea = All;
                }

                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
