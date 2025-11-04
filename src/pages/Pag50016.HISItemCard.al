page 50016 "3E HIS Item Card"
{

    Caption = 'HIS Item Card';
    PageType = Card;
    SourceTable = "3E HIS Master Staging";

    layout
    {
        area(content)
        {
            group(General)
            {

                field("Type"; Rec."Party Type")
                {
                    ToolTip = 'Specifies the value of the HIS Item Code field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("HIS Item Code"; Rec."HIS Code")
                {
                    ToolTip = 'Specifies the value of the HIS Item Code field';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Item Name"; Rec."Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field';
                    ApplicationArea = All;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Base Unit of Measure field';
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field';
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field';
                    ApplicationArea = All;
                }
                field("Inventory-NonInventory"; Rec."Inventory-NonInventory")
                {
                    ToolTip = 'Specifies the value of the Item Type field';
                    ApplicationArea = All;
                    Caption = 'Item Type';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("VAT Per"; Rec."VAT Per")
                {
                    ToolTip = 'Specifies the value of the Vat Per field';
                    ApplicationArea = All;
                }
                field("Service Code"; Rec."Service Code")
                {
                    ToolTip = 'Specifies the value of the Service Code field';
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ToolTip = 'Specifies the value of the Error Description field';
                    ApplicationArea = All;
                }
            }
            group("Log Details")
            {
                field("HIS Interface By"; Rec."HIS Interface By")
                {
                    ApplicationArea = All;
                    Editable = false;

                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("HIS Interface Date Time"; Rec."HIS Interface Date Time")
                {
                    ApplicationArea = All;
                    Editable = false;

                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Modified by"; Rec."Modified by")
                {
                    ApplicationArea = All;
                    Editable = false;

                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Modified Date Time"; Rec."Modified Date Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Send for Approval Request")
            {
                ApplicationArea = basic, suite;
                ToolTip = 'Send for Approval Request';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                trigger OnAction()
                var
                //HISCodeUnit: Codeunit "3E HIS Integration Mgmt.";
                begin
                    if Rec."Party Type" = Rec."Party Type"::Item then begin
                        //HISCodeUnit.ItemSendForPendingApproval(rec."Entry No.");
                    end;
                end;
            }
            action("Create Item Card")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Item Card';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin

                    if Rec."Party Type" = Rec."Party Type"::Item then
                        HISIntegration.InitItemMaster(Rec."Entry No.");
                end;

            }
        }

    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Party Type" := rec."Party Type"::Item;
    end;

}
