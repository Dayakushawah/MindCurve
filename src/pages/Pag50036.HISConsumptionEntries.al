page 50036 "3E HIS Consumption Entries"
{

    ApplicationArea = All;
    Caption = 'HIS Consumption Entries';
    PageType = List;
    SourceTable = "3E HIS Consumption Entries";
    SourceTableView = Sorting("Entry No.") where("General Entries Created" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Entry No."; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(UHID; Rec.UHID)
                {
                    Caption = 'UHID';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the UHID field.';
                }
                field(PATIENT_NAME; Rec."PATIENT_NAMES")
                {
                    Caption = 'PATIENT_NAME';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PATIENT_NAME field.';
                }
                field(ITEM_ID; Rec.ITEM_ID)
                {
                    Caption = 'ITEM_ID';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ITEM_ID field.';
                }
                field(ITEM_NAME; Rec.ITEM_NAME)
                {
                    Caption = 'ITEM_NAME';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ITEM_NAME field.';
                }
                field(QUANTITY; Rec.QUANTITY)
                {
                    Caption = 'QUANTITY';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the QUANTITY field.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Item Category Code field.';
                }
                field("Item Category Name"; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Item Category Name field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the HIS Document Type field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Amount"; Rec."Amount")
                {
                    Caption = 'Amount';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(DepartmentName; Rec.DepartmentName)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the DepartmentName field.';
                }
                field(Speciality; Rec.Speciality)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Speciality field.';
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
                field("Issue/Return Flag"; Rec."Issue/Return Flag")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Issue/Return Flag field.';
                    Caption = 'Issue/Return Flag';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Revenue Entries")
            {
                ApplicationArea = All;
                Image = CreateLedgerBudget;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Consumption Entries action.';
                Caption = 'Create Consumption Entries';
                trigger OnAction();
                var
                    HISPharmacyPost: Codeunit "3E HIS Integration Mgmt.";
                begin
                    HISPharmacyPost.InitGenJnlLineConsumptionEntry();

                end;
            }
            action("Post Revenue Entries")
            {
                ApplicationArea = All;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Consumption Entries action.';
                Caption = 'Post Consumption Entries';
                trigger OnAction();
                var
                    HISPharmacyPost: Codeunit "3E HIS Integration Mgmt.";
                begin

                    HISPharmacyPost.PostGenJnlLineConsumptionEntries();
                end;
            }
        }

    }

    trigger OnOpenPage()
    var
        GLAccount: Record "G/L Account";
        RecBank: Record "Bank Account";
    begin
        if (rec."Account Type" = Rec."Account Type"::"G/L Account") and (rec."GL Account Name" = '') then begin
            IF GLAccount.Get(Rec."Account No.") then;
            Rec."GL Account Name" := GLAccount.Name;
        end;

        if (Rec."Account Type" = Rec."Account Type"::"Bank Account") and (rec."GL Account Name" = '') then begin
            IF RecBank.Get(Rec."Account No.") then;
            Rec."GL Account Name" := RecBank.Name;
        end;
    End;

    trigger OnAfterGetRecord()
    var
        GLAccount: Record "G/L Account";
        RecBank: Record "Bank Account";
    begin
        if (rec."Account Type" = Rec."Account Type"::"G/L Account") and (rec."GL Account Name" = '') then begin
            IF GLAccount.Get(Rec."Account No.") then;
            Rec."GL Account Name" := GLAccount.Name;
        end;

        if (Rec."Account Type" = Rec."Account Type"::"Bank Account") and (rec."GL Account Name" = '') then begin
            IF RecBank.Get(Rec."Account No.") then;
            Rec."GL Account Name" := RecBank.Name;
        end;
    end;

}
