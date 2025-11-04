page 50027 "3E HIS E-Mail Setup"
{

    Caption = 'HIS E-Mail Setup';
    PageType = Card;
    ApplicationArea = Basic, Suit;
    SourceTable = "3E HIS E-Mail Setup";
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {
                group("E-Mail Report ID")
                {
                    field("Report ID:"; Rec."Report ID")
                    {
                        ToolTip = 'Specifies the value of the Report ID field';
                        ApplicationArea = All;
                    }
                }
                group("CC E-Mail")
                {
                    field("CC E-Mail ID:"; Rec."CC E-Mail ID")
                    {
                        ToolTip = 'Specifies the value of the CC E-Mail ID field';
                        ApplicationArea = All;
                        MultiLine = true;

                    }
                }
                group("Folder Path")
                {
                    field("Folder Path:"; Rec."Folder Path")
                    {
                        ToolTip = 'Specifies the value of the CC E-Mail ID field';
                        ApplicationArea = All;


                    }
                }

            }
            group("E-Mail Boody")
            {
                field("E-Mail Body"; Rec."E-Mail Body")
                {
                    ApplicationArea = Basic, Suite;
                    ShowCaption = false;
                    Editable = true;
                    MultiLine = true;
                }
            }
        }

    }

}
