page 50040 "3E HIS Revenue Subform"
{

    Caption = 'HIS Revenue Subform';
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "3E HIS Revenue Line";

    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(Revenue), "Document Type" = filter(Invoice));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Record Type"; Rec."Record Type")
                {
                    ToolTip = 'Specifies the value of the Record Type field';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Record Type';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Document Type';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the GRN No. field';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Documment No.';
                }
                field("Item ID"; Rec."Item ID")
                {
                    ToolTip = 'Specifies the value of the Item ID field';
                    ApplicationArea = All;
                    Caption = 'Item ID';
                    //Editable = false;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field';
                    ApplicationArea = All;
                    Caption = 'Item Name';
                    //Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                    Visible = false;
                    Caption = 'Entry No.';
                }

                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    Caption = 'Account Type';
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Service Category"; Rec."Service Category")
                {
                    ApplicationArea = All;
                    Caption = 'Service Category';
                    ToolTip = 'Specifies the value of the Service Category field.';
                }
                field("Service Item Code"; Rec."Service Item Code")
                {
                    ApplicationArea = All;
                    Caption = 'Service Item Code';
                    ToolTip = 'Specifies the value of the Service Item Code field.';
                }
                field(Quantity; Rec.Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Qty';
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                    Caption = 'Amount';
                    //Editable = false;
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field';
                    ApplicationArea = All;
                    Caption = 'Discount';
                    //Editable = false;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Net Amount';
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Patient Payable"; Rec."Patient Payable")
                {
                    ApplicationArea = All;
                    Caption = 'Patient Payable';
                    ToolTip = 'Specifies the value of the Patient Payable field.';
                }
                field("Payor Payable"; Rec."Payor Payable")
                {
                    ApplicationArea = All;
                    Caption = 'Payor Payable';
                    ToolTip = 'Specifies the value of the Payor Payable field.';
                }
                field("Package Patient"; Rec."Package Patient")
                {
                    ApplicationArea = All;
                    Caption = 'Package Patient';
                    ToolTip = 'Specifies the value of the Package Patient field.';
                }


                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 1 Code';
                    //Editable = false;

                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    //Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                    ApplicationArea = All;
                    Caption = 'Shortcut Dimension 2 Code';
                    //Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field';
                    ApplicationArea = All;
                    Caption = 'Department Name';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Record Type" := Rec."Record Type"::Revenue;
        Rec."Document Type" := Rec."Document Type"::Invoice;
    end;

}
