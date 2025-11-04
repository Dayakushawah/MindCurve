page 50069 "3E HIS Purchase Indent Subform"
{

    Caption = 'HIS Purchase Indent Subform';
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "3E HIS Indent Line";
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
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Item Type field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item ID"; Rec."Item ID")
                {
                    ToolTip = 'Specifies the value of the Item ID field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field';
                    ApplicationArea = All;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = true;
                }
                field("Service Code"; Rec."Service Code")
                {
                    ToolTip = 'Specifies the value of the Service Code field';
                    ApplicationArea = All;
                    Editable = true;
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
                    Editable = false;
                }

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Purchase Account"; Rec."Purchase Account")
                {
                    ToolTip = 'Specifies the value of the Purchase Account field';
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field';
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
                field("BatchNo"; Rec."BatchNo")
                {
                    ToolTip = 'Specifies the value of the BatchNo field';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("ExpiryDate"; Rec."ExpiryDate")
                {
                    ToolTip = 'Specifies the value of the ExpiryDate Code field';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ToolTip = 'Specifies the value of the Product Group Code field';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Indent No"; Rec."Indent No")
                {
                    ToolTip = 'Specifies the value of the Indent No field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Station SI No"; Rec."Station SI No")
                {
                    ToolTip = 'Specifies the value of the Station SI No field';
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }
}
