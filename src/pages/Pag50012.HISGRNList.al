page 50012 "3E HIS GRN List"
{

    ApplicationArea = All;
    Caption = 'HIS GRN List';
    PageType = List;
    Editable = false;
    CardPageId = "3E HIS GRN Header";
    InsertAllowed = false;
    SourceTable = "3E HIS Purchase Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(GRN), "Document Type" = filter(Order), "Capex Type" = filter('' | Opex), "Create PO" = filter(false));
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
                // field("Capex Type"; Rec."Capex Type")
                // {
                //     Caption = 'Capex Type';
                //     ToolTip = 'Specifies the value of the Capex Type field';
                // }
                field("GRN ID"; Rec."GRN ID")
                {
                    ToolTip = 'Specifies the value of the GRN ID field';
                    ApplicationArea = All;
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field';
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
                field("Posted Order No."; Rec."Posted Order No.")
                {
                    ToolTip = 'Specifies the value of the Posted Order No. field';
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
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RecDelete)
            {
                Caption = 'Delete Selected';
                Image = DeleteRow;
                ApplicationArea = all;
                ToolTip = 'Executes the Delete Selected action.';
                trigger OnAction()
                var
                    GRNHeader: Record "3E HIS Purchase Header";
                begin
                    CurrPage.SetSelectionFilter(GRNHeader);
                    if Confirm('Are you sure to delete selected records?', false) then
                        GRNHeader.DeleteAll(true);

                    CurrPage.Update(false);
                end;
            }
        }
    }

}
