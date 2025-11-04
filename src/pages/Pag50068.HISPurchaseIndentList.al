page 50068 "3E HIS Purchase Indent List"
{

    ApplicationArea = All;
    Caption = 'HIS Purchase Indent List';
    PageType = List;
    Editable = false;
    CardPageId = 50070;
    DelayedInsert = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "3E HIS Indent Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(Purchase | "Purchase Return"), "Document Type" = filter(Invoice | "Credit Memo"));//, "Create PO" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Record Type"; Rec."Record Type")
                {
                    ToolTip = 'Specifies the value of the Record Type field';
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
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
                field("Indent ID"; Rec."Indent ID")
                {
                    ToolTip = 'Specifies the value of the Indent ID field';
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                }
                field("Posted Pur Inv No."; Rec."Posted Purchase Inv No.")
                {
                    ToolTip = 'Specifies the value of the Posted Pur Inv No. field';
                    ApplicationArea = All;
                }
                field("Posted Pur Cr.Memo No."; Rec."Posted Pur Cr.Memo No.")
                {
                    ToolTip = 'Specifies the value of the Posted Pur Cr.Memo No. field';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                }
                field("Vendor/Customer No."; Rec."Vendor/Customer No.")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer No. field';
                    ApplicationArea = All;
                }
                field("Vendor/Customer Name"; Rec."Vendor/Customer Name")
                {
                    ToolTip = 'Specifies the value of the Vendor/Customer Name field';
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Description field';
                }
                field("Create PO"; Rec."Create PO")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Create PO field';
                }
                field("Station Name"; Rec."Station Name")
                {
                    ToolTip = 'Specifies the value of the Station Name field';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Created Pruchase Order/Credit Memo")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Created Pruchase Order/Credit Memo';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Indent Integration";
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec."Create PO" THEN begin
                        PurchHeader.Reset;
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice, PurchHeader."Document Type"::"Credit Memo");
                        PurchHeader.SetRange("No.", Rec."Document No.");
                        if PurchHeader.FindFirst() then begin
                            Page.RunModal(Page::"Purchase Invoice", PurchHeader);
                            IF Rec."Record Type" = Rec."Record Type"::"Purchase Return" then
                                Page.RunModal(Page::"Purchase Credit Memo", PurchHeader);
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
                    IF Rec."Create PO" THEN begin
                        PurchInvHeader.Reset;
                        PurchInvHeader.SetRange("No.", Rec."Document No.");
                        if PurchInvHeader.FindFirst() then begin
                            Page.RunModal(Page::"Posted Purchase Invoices", PurchInvHeader);
                        end;
                    end;
                end;
            }

        }
    }


}
