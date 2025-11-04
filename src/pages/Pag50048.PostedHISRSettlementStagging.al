page 50048 "3E Posted HIS Sett. Stagging"
{

    ApplicationArea = All;
    Caption = 'Posted HIS Settlement Stagging';
    PageType = List;
    Editable = false;
    SourceTableView = Sorting("Entry No.") where("General Entries Created" = filter(true), SettlementType = filter(Settlement));
    SourceTable = "3E HIS Settlement Staging";
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
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;

                }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ToolTip = 'Specifies the value of the Document Type field';
                //     ApplicationArea = All;
                // }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    ToolTip = 'Specifies the value of the HIS Document Type field';
                    ApplicationArea = All;
                    Caption = 'Settlement Type';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field';
                    ApplicationArea = All;
                }
                // field("Mode of Payment"; Rec."Mode of Payment")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Mode of Payment field.';
                // }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field';
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field';
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field';
                    ApplicationArea = All;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ToolTip = 'Specifies the value of the Bal. Account Type field';
                    ApplicationArea = All;
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    ToolTip = 'Specifies the value of the Bal. Account No field';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                }
                // field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                // {
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                //     ApplicationArea = All;
                // }
                // field("Cheque No."; Rec."Cheque No.")
                // {
                //     ToolTip = 'Specifies the value of the Cheque No. field';
                //     ApplicationArea = All;
                // }
                // field("Cheque Date"; Rec."Cheque Date")
                // {
                //     ToolTip = 'Specifies the value of the Cheque Date field';
                //     ApplicationArea = All;
                // }
                field("Patient Name"; Rec."Patient Name")
                {
                    ToolTip = 'Specifies the value of the Patient Name field';
                    ApplicationArea = All;
                }
                field(UHID; Rec.UHID)
                {
                    ToolTip = 'Specifies the value of the UHID field';
                    ApplicationArea = All;
                }
                field("Encounter No."; Rec."Encounter No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Encounter No. field.';
                }
                field("IP No."; Rec."IP No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IP No. field.';
                }

                // field("Package Patient"; Rec."Package Patient")
                // {
                //     ToolTip = 'Specifies the value of the Package Patient field';
                //     ApplicationArea = All;
                // }
                field("HIS User ID"; Rec."HIS User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HIS User ID field.';
                }
                field("HIS User Name"; Rec."HIS User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HIS User Name field.';
                }
                field("Sponsor Code"; Rec."Sponsor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Code field.';
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Name field.';
                }
                field("Payer Code"; Rec."Payer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Code field.';
                }
                field("Payer Name"; Rec."Payer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Name field.';
                }
                field("Payor Category"; Rec."Payor Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payor Category field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                }
                field("General Template Code"; Rec."General Template Code")
                {
                    ToolTip = 'Specifies the value of the General Template Code field';
                    ApplicationArea = All;
                }
                field("General Batch Code"; Rec."General Batch Code")
                {
                    ToolTip = 'Specifies the value of the General Batch Code field';
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ToolTip = 'Specifies the value of the Error Description field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    ApplicationArea = All;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post Settlement Entries")
            {
                ApplicationArea = All;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    HISIntegration.PostGenJnlLineEntries();

                end;
            }

        }
    }

}
