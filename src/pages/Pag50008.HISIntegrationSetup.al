page 50008 "3E Integration Setup"
{
    ApplicationArea = Basic, Suite;
    Caption = 'HIS Integration Setup';
    PageType = Document;
    UsageCategory = Administration;
    SourceTable = "3E HIS Integartion Setup";

    layout
    {
        area(content)
        {
            group("Setup Configuration")
            {
                field("Integration Enabled"; Rec."Integration Enabled")
                {
                    ToolTip = 'Specifies the value of the Integration Enabled field';
                    ApplicationArea = All;
                }
                field("Customer Creation Enabled"; Rec."Customer Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the Customer Creation Enabled field';
                    ApplicationArea = All;
                }
                field("Item Creation Enabled"; Rec."Item Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the Item Creation Enabled field';
                    ApplicationArea = All;
                }
                field("Employee Creation Enabled"; Rec."Employee Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the Item Creation Enabled field';
                    ApplicationArea = All;
                }
                field("Adjustment Creation Enables"; Rec."Adjustment Creation Enables")
                {
                    ToolTip = 'Specifies the value of the Item Creation Enabled field';
                    ApplicationArea = All;
                }
                field("Vendor Creation Enabled"; Rec."Vendor Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the Vendor Creation Enabled field';
                    ApplicationArea = All;
                }
                field("Custom Gen. Bus. Posting Group"; Rec."Custom Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Custom Gen. Bus. Posting Group field';
                    ApplicationArea = All;
                }
                field("Vendor Gen. Bus. Posting Group"; Rec."Vendor Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Vendor Gen. Bus. Posting Group field';
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
                field("GRN Item Wise/ Account Wise"; Rec."GRN Item Wise/ Account Wise")
                {
                    ToolTip = 'Specifies the value of the GRN Item Wise/ Account Wise field';
                    ApplicationArea = All;
                }

                field("GRN Creation Enabled"; Rec."GRN Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the GRN Creation Enabled Wise field';
                    ApplicationArea = All;
                }
                field("GRN Return Creation Enabled"; Rec."GRN Return Creation Enabled")
                {
                    ToolTip = 'Specifies the value of the GRN Return Creation Enabled Wise field';
                    ApplicationArea = All;
                }
                field("GRN/GRN Return Handling"; Rec."GRN/GRN Return Handling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GRN/GRN Return Handling field.';
                }

                field("Revenue/Rev. Cancel Handling"; Rec."Revenue/Rev. Cancel Handling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revenue/Revenue Cancel Handling field.';
                }
                field("Rev./Rev.Cancel Direct Post"; Rec."Rev./Rev.Cancel Direct Post")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revenue/Rev. Cancel Direct Post field.';
                }
                field("Revenue Creation Enabled"; Rec."Revenue Creation Enabled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revenue Creation Enabled field.';
                }
                field("Consumption Creation Enabled"; Rec."Consumption Creation Enabled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consumption Creation Enabled field.';
                }
                field("Job Qu. Purchase Export Enabled"; Rec."Job Qu. Purchase Enabled")
                {
                    ToolTip = 'Specifies the value of the Job Qu. Purchase Export Enabled Wise field';
                    ApplicationArea = All;
                }

                field("Job Qu. Purch. Return Export Enabled"; Rec."Job Qu. Purch. Ret Cr. Enabled")
                {
                    ToolTip = 'Specifies the value of the Job Qu. Purch. Return Export Enabled Enabled Wise field';
                    ApplicationArea = All;
                }
            }
            group("Log Details")
            {
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = ALL;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
            }
            part(HISIntegrationSubform; 50009)
            {
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
            }
        }


        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }


    }

}
