page 50072 "3E HIS Sales Indent Header"
{

    Caption = 'HIS Sales Indent Header';
    PageType = Document;
    Editable = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    DelayedInsert = false;
    SourceTable = "3E HIS Indent Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(Sales | "Sales Return"), "Document Type" = filter(Invoice | "Credit Memo"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Record Type"; Rec."Record Type")
                {
                    ToolTip = 'Specifies the value of the Record Type field';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Vendor/Customer No."; Rec."Vendor/Customer No.")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer No. field';
                    ApplicationArea = All;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Editable = false;
                }
                field("Vendor/Customer Name"; Rec."Vendor/Customer Name")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer Name field';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    StyleExpr = false;
                    Editable = false;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Invoice No. field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Invoice Date"; Rec."Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice Date field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Indent Order No."; Rec."Indent Order No.")
                {
                    ToolTip = 'Specifies the value of the Indent Order No. field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Indent Order Date"; Rec."Indent Order Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Order Date field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No. of Lines"; Rec."No. of Lines")
                {
                    ToolTip = 'Specifies the value of the No. of Lines field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Editable = false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ToolTip = 'Specifies the value of the VAT field';
                    ApplicationArea = All;
                    Style = StrongAccent;
                    StyleExpr = true;
                    Editable = false;
                }
                field("Station Name"; Rec."Station Name")
                {
                    ToolTip = 'Specifies the value of the Station Name field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Create PO"; Rec."Create PO")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Customer/Vendor No."; Rec."Error 1")
                {
                    Caption = 'Vendor/Customer No';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Pruchase Account"; Rec."Error 2")
                {
                    Caption = 'Purchase Account';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("HSN Code"; Rec."Error 3")
                {
                    Caption = 'HSN/SAC Code';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("GST Group Code"; Rec."Error 4")
                {
                    Caption = 'GST Group Code';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }

            }
            part(HISPurchaseSubform; 50073)
            {
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
                SubPageLink = "Document No." = FIELD("Document No."), "Record Type" = field("Record Type"),
                "document Type" = field("Document Type");
                Editable = blnPageEditable;
            }
            group("Log Details")
            {
                field(SystemCreatedBy; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = ALL;
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

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Indent Integration";
                begin
                    IF NOT REC."Create PO" then begin
                        if (Rec."Record Type" = Rec."Record Type"::Sales) or (Rec."Record Type" = Rec."Record Type"::"Sales Return") and (Rec."Document Type" = Rec."Document Type"::Invoice)
                        or (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.OrderValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Sales Order is already Created.No need to Validate Sales Order');
                end;
            }
            action("GRN Order ReValidate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order ReValidate';
                Visible = blnPageEditable;
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Indent Integration";
                begin
                    IF NOT REC."Create PO" then begin
                        if (Rec."Record Type" = Rec."Record Type"::Sales) or (Rec."Record Type" = Rec."Record Type"::"Sales Return") and (Rec."Document Type" = Rec."Document Type"::Invoice)
                        or (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.OrderREValidation(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Sales Order is already Created.No need to ReValidate Sales Order');
                end;
            }
            action("Create Sales Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Sales Order';
                Image = Create;
                Visible = blnPageEditable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Indent Integration";
                begin
                    IF NOT REC."Create PO" then begin
                        if (Rec."Record Type" = Rec."Record Type"::Sales) or (Rec."Record Type" = Rec."Record Type"::"Sales Return") and (Rec."Document Type" = Rec."Document Type"::Invoice)
                        OR (Rec."Document Type" = Rec."Document Type"::"Credit Memo") then begin
                            HISIntegration.InitSalesOrder(Rec."Record Type", Rec."Document Type", Rec."Document No.");
                        end;
                    END ELSE
                        Error('Sales Order is already Created.No need to Create Sales Order %1', Rec."Document No.");


                end;
            }

            action("Created Pruchase Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Created Sales Order/Credit Memo';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Indent Integration";
                    PurchHeader: Record "Sales Header";
                begin
                    IF Rec."Create PO" THEN begin
                        PurchHeader.Reset;
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice, PurchHeader."Document Type"::"Credit Memo");
                        PurchHeader.SetRange("No.", Rec."Document No.");
                        if PurchHeader.FindFirst() then begin
                            IF Rec."Record Type" = Rec."Record Type"::Sales then
                                Page.RunModal(Page::"Sales Invoice", PurchHeader);
                            IF Rec."Record Type" = Rec."Record Type"::"Sales Return" then
                                Page.RunModal(Page::"Sales Credit Memo", PurchHeader);
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec."Create PO" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Create PO" then
            blnPageEditable := false
        ELSE
            blnPageEditable := true;
    end;


    var
        blnPageEditable: Boolean;
        PurchHeader: Record "Sales Header";
        FileManagement: Codeunit "File Management";
        Text0001: TextConst ENU = 'Select Directory', ENN = 'Select Directory';
}
