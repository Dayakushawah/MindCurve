page 50005 "3E Posted HIS Vend. Stg. Card"
{

    Caption = 'Posted HIS Vendor Staging Card';
    PageType = Card;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = SORTING("Entry No.") WHERE(IsCreated = FILTER(true), "Party Type" = FILTER(Vendor), "Error Description" = FILTER(''));
    SourceTable = "3E HIS Master Staging";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("HIS Code"; Rec."HIS Code")
                {
                    ToolTip = 'Specifies the value of the HIS Code field';
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Party Type"; Rec."Party Type")
                {
                    ToolTip = 'Specifies the value of the Party Type field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ToolTip = 'Specifies the value of the Name 2 field';
                    ApplicationArea = All;
                }
            }
            group("Address Information")
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = ALL;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = all;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Vendor/Customer Code"; Rec."Vendor/Customer Code")
                {
                    ApplicationArea = all;
                }

            }
            group("Invoicing Information")
            {
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = ALL;
                }

            }
            group("Statutory Details")
            {
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the vendors VAT registration number.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the registration number of the vendor. You can enter a maximum of 20 characters, both numbers and letters.';
                }
            }
            group("Bank Details")
            {
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = all;
                }
                field("Vendor Bank Account Name"; Rec."VC Bank Account Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Address"; Rec."Bank Address")
                {
                    ApplicationArea = all;
                }
                field("Bank Address 2"; Rec."Bank Address 2")
                {
                    ApplicationArea = all;
                }
                field("Bank Post Code"; Rec."Bank Post Code")
                {
                    ApplicationArea = all;
                }
                field("Bank City"; Rec."Bank City")
                {
                    ApplicationArea = all;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = all;
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = all;
                }
                field("Bank IFSC Code"; Rec."IFSC Code")
                {
                    ApplicationArea = all;
                }
            }
            group("Log Details")
            {
                field(SystemCreatedBy; Rec.SystemCreatedBy)
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
                field(IsCreated; Rec.IsCreated)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }

        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Vendor Card")
            {
                ApplicationArea = All;
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vendor Card";
                RunPageView = SORTING("No.") ORDER(Ascending);
                RunPageLink = "No." = field("Vendor/Customer Code");
                trigger OnAction();
                begin

                end;
            }
        }
    }

}
