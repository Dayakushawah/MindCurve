page 50013 "3E HIS GRN Header"
{

    Caption = 'HIS GRN Header';
    PageType = Document;
    //Editable = blnPageEditable;
    // InsertAllowed = false;
    // DeleteAllowed = false;
    DelayedInsert = true;
    RefreshOnActivate = true;
    SourceTable = "3E HIS Purchase Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(GRN), "Document Type" = filter(Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Record Type"; Rec."Record Type")
                {
                    ToolTip = 'Specifies the value of the Record Type field';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Record Type';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Document Type';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    //Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field';
                    ApplicationArea = All;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Vendor No.';
                    //Editable = false;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    StyleExpr = false;
                    Caption = 'Vendor Name';
                }
                field("Address Code"; Rec."Address Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address Code field.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field';
                    ApplicationArea = All;
                    Caption = 'Vendor Invoice No.';
                }
                field("Vendor Invoice Date"; Rec."Vendor Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice Date field';
                    ApplicationArea = All;
                    Caption = 'Vendor Invoice Date';
                    //Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ToolTip = 'Specifies the value of the Purchase Order No. field';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Purchase Order No.';
                }
                field("Purchase Order Date"; Rec."Purchase Order Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Order Date field';
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Purchase Order Date';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                    //Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                    Caption = 'Location Code';
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
                // field("Capex Type"; Rec."Capex Type")
                // {
                //     ToolTip = 'Specifies the value of the Capex Type field';
                //     ApplicationArea = All;
                //     Style = StrongAccent;
                //     StyleExpr = true;
                //     Caption = 'Capex Type';
                //     //Editable = false;
                // }
                field("Create PO"; Rec."Create PO")
                {
                    ApplicationArea = All;
                    //Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Create PO';
                    ToolTip = 'Specifies the value of the Create PO field.';
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
                field("Vendor No. Error"; Rec."Error 1")
                {
                    Caption = 'Vendor No Error';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Vendor/Customer No field.';
                }
                field("Purchase Account"; Rec."Error 2")
                {
                    Caption = 'Purchase Account';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Purchase Account field.';
                }
                field("HSN Code"; Rec."Error 3")
                {
                    Caption = 'HSN/SAC Code';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the HSN/SAC Code field.';
                }
                field("GST Group Code"; Rec."Error 4")
                {
                    Caption = 'GST Group Code';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the GST Group Code field.';
                }
                field("Store Name"; Rec."Store Name")
                {
                    ApplicationArea = All;
                    Caption = 'Store Name';
                    ToolTip = 'Specifies the value of the Store Name field.';
                }

            }
            part(HISPurchaseSubform; "3E HIS Purchase Subform")
            {
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
                SubPageLink = "Document No." = FIELD("Document No."), "Record Type" = field("Record Type"), "document Type" = field("Document Type");
                Editable = blnPageEditable;
                Caption = 'HIS Purchase Subform';
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
            action("GRN Order Validate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'GRN Order Validate';
                Image = Create;
                Visible = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the GRN Order Validate action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create PO" then begin
                        ;
                        if (Rec."Record Type" = Rec."Record Type"::GRN) and (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            HISIntegration.OrderValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Purchase Order is already Created.No need to Validate Purchase Order');
                end;
            }
            action("GRN Order ReValidate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'GRN Order ReValidate';
                Visible = blnPageEditable;
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the GRN Order ReValidate action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create PO" then begin
                        ;
                        if (Rec."Record Type" = Rec."Record Type"::GRN) and (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            HISIntegration.OrderREValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Purchase Order is already Created.No need to ReValidate Purchase Order');
                end;
            }
            action("Create Pruchase Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Acknowledge GRN';
                Image = Create;
                Visible = ShowHideButton;
                Enabled = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Acknowledge GRN action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create PO" then begin
                        if (Rec."Record Type" = Rec."Record Type"::GRN) and (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            HISIntegration.InitPurchaseOrder(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Purchase Order is already Created.No need to Create Purchase Order %1', Rec."Document No.");


                end;
            }

            action("Create Pruchase Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Invoice';
                Image = Create;
                Visible = not ShowHideButton;
                Enabled = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Acknowledge GRN action.';
                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    IF NOT REC."Create PO" then begin
                        if (Rec."Record Type" = Rec."Record Type"::GRN) and (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            HISIntegration.InitPurchaseOrder(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Purchase Invoice is already Created.No need to Create Purchase Invoice %1', Rec."Document No.");

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Record Type" := Rec."Record Type"::GRN;
        Rec."Document Type" := Rec."Document Type"::Order;
        Rec.Type := Rec.Type::Vendor;
    end;

    trigger OnOpenPage()
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Invoices" then
            ShowHideButton := false
        else
            ShowHideButton := true;

        if Rec."Create PO" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;


    end;

    trigger OnAfterGetRecord()
    begin
        IntegrationSetup.Get();
        if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Invoices" then
            ShowHideButton := false
        else
            ShowHideButton := true;

        if Rec."Create PO" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;
    end;


    var
        IntegrationSetup: Record "3E HIS Integartion Setup";
        ShowHideButton: Boolean;
        blnPageEditable: Boolean;
        PurchHeader: Record "Purchase Header";
        FileManagement: Codeunit "File Management";
        Text0001: TextConst ENU = 'Select Directory', ENN = 'Select Directory';
        CaptionValue: Text;
}
