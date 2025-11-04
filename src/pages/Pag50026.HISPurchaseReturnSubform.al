page 50026 "3E HIS Purch. Return Subform"
{

    Caption = 'HIS Purchase Return Subform';
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "3E HIS Purchase Line";

    SourceTableView = sorting("Entry No.") where("Record Type" = Filter("GRN Return"), "Document Type" = filter("Return Order"));

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
                    Visible = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the GRN No. field';
                    ApplicationArea = All;
                    Visible = false;
                    //Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Item ID"; Rec."Item ID")
                {
                    ToolTip = 'Specifies the value of the Item ID field';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field';
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Received Qty"; Rec."Received Qty")
                {
                    ToolTip = 'Specifies the value of the Received Qty field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Free Qty"; Rec."Free Qty")
                {
                    ToolTip = 'Specifies the value of the Free Qty field';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ToolTip = 'Specifies the value of the Gross Amount field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("VAT Per"; Rec."VAT Per")
                {
                    ToolTip = 'Specifies the value of the VAT Per field';
                    ApplicationArea = All;
                }
                field("Service Code"; Rec."Service Code")
                {
                    ToolTip = 'Specifies the value of the Service Code field';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field';
                    ApplicationArea = All;
                    //Editable = false;
                }

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Other Charges"; Rec."Other Charges")
                {
                    ToolTip = 'Specifies the value of the Other Charges field';
                    ApplicationArea = All;
                    //Editable = false;
                }

                field("Purchase Account"; Rec."Purchase Account")
                {
                    ToolTip = 'Specifies the value of the Purchase Account field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
                    ApplicationArea = All;
                    //Editable = false;
                }
                // field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                // {
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                //     ApplicationArea = All;
                //     //Editable = false;
                // }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field';
                    ApplicationArea = All;
                    //Editable = false;

                }
                field("Item Category Code"; rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specify the Item Category Code';
                }
                field("Item Category Name"; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Category Name field';
                }
                field("Item Sub Category"; rec."Item Sub Category")
                {
                    ApplicationArea = All;
                }
                field("Discount %"; rec."Discount %")
                {
                    ApplicationArea = All;
                }
                field("Batch No"; rec."Batch No")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measurement"; rec."Unit of Measurement")
                {
                    ApplicationArea = All;
                }
                field("Pack Size"; rec."Pack Size")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Record Type" := Rec."Record Type"::"GRN Return";
        Rec."Document Type" := Rec."Document Type"::"Return Order";
    end;

}
