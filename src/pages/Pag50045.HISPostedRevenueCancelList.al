page 50045 "3E HIS Posted Rev Cancel List"
{

    ApplicationArea = All;
    Caption = 'HIS Posted Revenue Cancel List';
    PageType = List;
    Editable = false;
    CardPageId = "3E HIS Revenue Cancel Header";
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "3E HIS Revenue Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter("Revenue Cancel"), "Document Type" = filter("Credit Memo"), "Create Revenue" = filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field("Record Type"; Rec."Record Type")
                // {
                //     ToolTip = 'Specifies the value of the Record Type field';
                //     ApplicationArea = All;
                // }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ToolTip = 'Specifies the value of the Document Type field';
                //     ApplicationArea = All;
                // }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HIS Document Type field.';
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
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                }
                field("Posted Revenue No."; Rec."Posted Revenue No.")
                {
                    ToolTip = 'Specifies the value of the Posted Revenue No. field';
                    ApplicationArea = All;
                    Visible = ShowHideButton;
                }
                field("Posted Document No."; Rec."Posted Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Document No. field.';
                    Visible = not ShowHideButton;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Patient Name field.';
                    Caption = 'Patient Name';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                    Caption = 'External Document No.';
                }
                field(UHID; Rec.UHID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UHID field.';
                    Caption = 'UHID';
                }
                field("Encounter No."; Rec."Encounter No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Encounter No. field.';
                    Caption = 'Encounter No.';
                }

                field(Doctor; Rec.Doctor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Doctor field.';
                    Caption = 'Doctor';
                }
                field(Speciality; Rec.Speciality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Speciality field.';
                    Caption = 'Speciality';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Code field.';
                    Caption = 'Unit Code';
                }
                field("Sponsor Code"; Rec."Sponsor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Code field.';
                    Caption = 'Sponsor Code';
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Name field.';
                    Caption = 'Sponsor Name';
                }
                field("Payer Code"; Rec."Payer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Code field.';
                    Caption = 'Payer Code';
                }
                field("Payer Name"; Rec."Payer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Name field.';
                    Caption = 'Payer Name';
                }
                field("Payor Category"; Rec."Payor Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payor Category field.';
                    Caption = 'Payor Category';
                }
                field("Admission Date Time"; Rec."Admission Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Date Time field.';
                    Caption = 'Admission Date Time';
                }
                field("Discharge Date Time"; Rec."Discharge Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discharge Date Time field.';
                    Caption = 'Discharge Date Time';
                }
                field("Admission Source"; Rec."Admission Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Source field.';
                    Caption = 'Admission Source';
                }
                field("Package Patient"; Rec."Package Patient")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Package Patient field.';
                    Caption = 'Package Patient';
                }
                field("Admission Bed Category"; Rec."Admission Bed Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Bed Category field.';
                    Caption = 'Admission Bed Category';
                }
                field("Discharge Bed Category"; Rec."Discharge Bed Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discharge Bed Category field.';
                    Caption = 'Discharge Bed Category';
                }

                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Error Description';
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Revenue Entries")
            {
                ApplicationArea = All;
                Caption = 'Post Journal Entries';
                Image = PostBatch;
                Visible = not ShowHideButton;
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
            action("Post Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Invoice';
                Image = Create;
                Visible = ShowHideButton;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Post Invoice action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                    PurchHeader: Record "Sales Header";
                begin
                    IF Rec."Create Revenue" THEN begin
                        PurchHeader.Reset;
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::"Credit Memo");
                        PurchHeader.SetRange("No.", Rec."Document No.");
                        if PurchHeader.FindFirst() then begin
                            Page.RunModal(Page::"Sales Credit Memo", PurchHeader);
                        end;
                    end;
                end;
            }
            action("Posted Pruchase Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Cr. Memo Invoice';
                Image = Archive;
                Visible = ShowHideButton;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Posted Cr. Memo Invoice action.';
                trigger OnAction()
                var
                    PurchInvHeader: Record "Sales Cr.Memo Header";
                begin
                    IF Rec."Create Revenue" THEN begin
                        PurchInvHeader.Reset;
                        PurchInvHeader.SetRange("No.", Rec."Document No.");
                        if PurchInvHeader.FindFirst() then begin
                            Page.RunModal(Page::"Posted Sales Credit Memo", PurchInvHeader);
                        end;
                    end;
                end;
            }

        }
    }

    trigger OnOpenPage()
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then
            ShowHideButton := true
        else
            ShowHideButton := false;
    end;


    var
        IntegrationSetup: Record "3E HIS Integartion Setup";
        ShowHideButton: Boolean;


}

