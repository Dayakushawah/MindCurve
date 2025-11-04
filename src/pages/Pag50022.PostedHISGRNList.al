page 50022 "3E Posted HIS GRN List"
{

    ApplicationArea = All;
    Caption = 'Posted HIS GRN List';
    PageType = List;
    Editable = false;
    CardPageId = 50013;
    DelayedInsert = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "3E HIS Purchase Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(GRN), "Document Type" = filter(Order), "Create PO" = filter(true));
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
                field("GRN ID"; Rec."GRN ID")
                {
                    ToolTip = 'Specifies the value of the GRN ID field';
                    ApplicationArea = All;
                }
                field("Store Name"; Rec."Store Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store Name field';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field';
                }
                field("Posted Order No."; Rec."Posted Order No.")
                {
                    ToolTip = 'Specifies the value of the Posted Order No. field';
                    ApplicationArea = All;
                }
                field("FI Posting Date"; Rec."FI Posting Date")
                {
                    ToolTip = 'Specifies the value of the FI Posting Date field';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                }
                field("Vendor/Customer No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer No. field';
                    ApplicationArea = All;
                }
                field("Vendor/Customer Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer Name field';
                    ApplicationArea = All;
                }

                // field("Capex Type"; Rec."Capex Type")
                // {
                //     ToolTip = 'Specifies the value of the Capex Type field';
                //     ApplicationArea = All;
                //     Style = StrongAccent;
                //     StyleExpr = true;
                // }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                }
                field("Create PO"; Rec."Create PO")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {

            action("Post Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Invoice';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec."Create PO" THEN begin
                        IntegrationSetup.Get();
                        PurchHeader.Reset;
                        if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Invoices" then begin
                            PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice);
                            PurchHeader.SetRange("No.", Rec."Document No.");
                            if PurchHeader.FindFirst() then
                                Page.RunModal(Page::"Purchase Invoice", PurchHeader);
                        end else begin
                            PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::"Order");
                            PurchHeader.SetRange("No.", Rec."Document No.");
                            if PurchHeader.FindFirst() then
                                Page.RunModal(Page::"Purchase Order", PurchHeader);
                        end;
                    end;
                end;
            }
            action("Posted Pruchase Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Pruchase Invoice';
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    PurchInvHeader: Record "Purch. Inv. Header";
                begin
                    IF Rec."Create PO" then begin
                        PurchInvHeader.Reset();
                        PurchInvHeader.SetRange("Vendor Invoice No.", Rec."Vendor Invoice No.");
                        if PurchInvHeader.FindLast() then //begin
                            Page.RunModal(Page::"Posted Purchase Invoices", PurchInvHeader);
                    end;
                end;
                //end;
            }

        }
    }

    var
        IntegrationSetup: Record "3E HIS Integartion Setup";
}
