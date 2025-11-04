page 50043 "3E HIS Revenue Cancel Header"
{

    Caption = 'HIS Revenue Cancel Header';
    PageType = Document;
    DelayedInsert = true;
    RefreshOnActivate = true;
    SourceTable = "3E HIS Revenue Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter("Revenue Cancel"), "Document Type" = filter("Credit Memo"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = not Rec."Create Revenue";

                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Document Type';
                }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HIS Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    //Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field';
                    Caption = 'Document Date';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field("No. of Lines"; Rec."No. of Lines")
                {
                    ToolTip = 'Specifies the value of the No. of Lines field';
                    ApplicationArea = All;
                    Caption = 'No. of Lines';
                    //Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Caption = 'Amount';
                    //Editable = false;
                }
                field("Patient Payable"; Rec."Patient Payable")
                {
                    Caption = 'Patient Payable';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Patient Payable field';
                }
                field("Payor Payable"; Rec."Payor Payable")
                {
                    Caption = 'Payor Payable';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payor Payable field';
                }
                field("Create Revenue"; Rec."Create Revenue")
                {
                    ApplicationArea = All;
                    //Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Create Revenue field.';
                    Caption = 'Create Revenue';
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Patient Name field.';
                    Caption = 'Patient Name';
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

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field("Speciality Code"; Rec."Speciality Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Speciality Code field.';
                    Caption = 'Speciality Code';
                }
                field(Speciality; Rec.Speciality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Speciality field.';
                    Caption = 'Speciality';
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
                field("Customer No. Error"; Rec."Error 1")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Customer No. Error';
                    ToolTip = 'Specifies the value of the Customer No. Error field.';
                }
                field("Revenue Account"; Rec."Error 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Revenue Account';
                    ToolTip = 'Specifies the value of the Revenue Account field.';
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
            part(HISRevenueCancelSubform; "3E HIS Revenue Cancel Subform")
            {
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
                SubPageLink = "Document No." = FIELD("Document No."), "Record Type" = field("Record Type"), "document Type" = field("Document Type");
                Editable = blnPageEditable;
                Caption = 'HIS Revenue Cancel Subform';
            }
            group("Log Details")
            {
                Editable = false;
                Caption = 'Log Details';
                field(SystemCreatedBy; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Caption = 'SystemId';
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Caption = 'SystemCreatedAt';
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Caption = 'SystemModifiedBy';
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = ALL;
                    Caption = 'SystemModifiedAt';
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Revenue Cancel Validate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Revenue Cancel Validate';
                Image = Create;
                Visible = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Revenue Cancel Validate action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create Revenue" then begin
                        ;
                        if (Rec."Record Type" = Rec."Record Type"::"Revenue Cancel") and (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.RevenueInvoiceValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Revenue Cancel is already Created. No need to Validate Revenue Cancel.');
                end;
            }
            action("Revenue Cancel ReValidate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Revenue Cancel ReValidate';
                Visible = blnPageEditable;
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Revenue Cancel ReValidate action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create Revenue" then begin
                        ;
                        if (Rec."Record Type" = Rec."Record Type"::"Revenue Cancel") and (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.RevenueInvoiceReValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Revenue Cancel is already Created. No need to ReValidate Revenue Cancel');
                end;
            }
            action("Cancel Revenue Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Revenue Invoice';
                Image = Create;
                Visible = ShowHideButton;
                Enabled = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Revenue Invoice action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create Revenue" then begin
                        if (Rec."Record Type" = Rec."Record Type"::"Revenue Cancel") and (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.InitRevenueInvoice(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Revenue Invoice is already cancelled. No need to cancel Revenue Invoice %1', Rec."Document No.");

                end;
            }

            action("Cancel Revenue Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Revenue Journal';
                Image = Create;
                Visible = not ShowHideButton;
                Enabled = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Revenue Journal action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create Revenue" then begin
                        if (Rec."Record Type" = Rec."Record Type"::"Revenue Cancel") and (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.InitRevenueInvoice(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Revenue Journal is already cancelled. No need to cancel Revenue Journal %1', Rec."Document No.");

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Record Type" := Rec."Record Type"::"Revenue Cancel";
        Rec."Document Type" := Rec."Document Type"::"Credit Memo";
        Rec.Type := Rec.Type::Customer;
    end;

    trigger OnOpenPage()
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then
            ShowHideButton := true
        else
            ShowHideButton := false;

        if Rec."Create Revenue" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;
    end;

    trigger OnAfterGetRecord()
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then
            ShowHideButton := true
        else
            ShowHideButton := false;

        if Rec."Create Revenue" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;
    end;


    var
        IntegrationSetup: Record "3E HIS Integartion Setup";
        ShowHideButton: Boolean;
        blnPageEditable: Boolean;
}
