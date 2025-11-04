page 50031 "3E HIS Pharmacy Entries"
{

    ApplicationArea = All;
    Caption = 'HIS Pharmacy Entries';
    PageType = List;
    SourceTable = "3E HIS Pharmacy Entries";
    SourceTableView = Sorting("Entry No.") where("General Entries Created" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ApplicationArea = all;
                }
                field(HSPLOCATIONID; Rec.HSPLOCATIONID)
                {
                    Caption = 'HSPLOCATIONID';
                    ApplicationArea = all;
                }
                field(ORGANIZATION_NAME; Rec.ORGANIZATION_NAME)
                {
                    Caption = 'ORGANIZATION_NAME';
                    ApplicationArea = all;
                }
                field(EPISODE; Rec.EPISODE)
                {
                    Caption = 'EPISODE';
                    ApplicationArea = all;
                }
                field(TRANSACTION_TYPE; Rec.TRANSACTION_TYPE)
                {
                    Caption = 'TRANSACTION_TYPE';
                    ApplicationArea = all;
                }
                field(UHID; Rec.UHID)
                {
                    Caption = 'UHID';
                    ApplicationArea = all;
                }
                field(PATIENT_NAME; Rec."PATIENT_NAMES")
                {
                    Caption = 'PATIENT_NAME';
                    ApplicationArea = all;
                }
                field(SERVICE_ID; Rec.SERVICE_ID)
                {
                    Caption = 'SERVICE_ID';
                    ApplicationArea = all;
                }
                field(SERVICE_NAME; Rec.SERVICE_NAME)
                {
                    Caption = 'SERVICE_NAME';
                    ApplicationArea = all;
                }
                field(ITEM_ID; Rec.ITEM_ID)
                {
                    Caption = 'ITEM_ID';
                    ApplicationArea = all;
                }
                field(ITEM_NAME; Rec.ITEM_NAME)
                {
                    Caption = 'ITEM_NAME';
                    ApplicationArea = all;
                }
                field(QUANTITY; Rec.QUANTITY)
                {
                    Caption = 'QUANTITY';
                    ApplicationArea = all;
                }
                field(PRICE; Rec.PRICE)
                {
                    Caption = 'PRICE';
                    ApplicationArea = all;
                }
                field("VAT %"; Rec."VAT %")
                {
                    Caption = 'VAT %';
                    ApplicationArea = all;
                }
                field(DISCOUNT_AMOUNT; Rec.DISCOUNT_AMOUNT)
                {
                    Caption = 'DISCOUNT_AMOUNT';
                    ApplicationArea = all;
                }
                field(Stationid; Rec.Stationid)
                {
                    Caption = 'Stationid';
                    ApplicationArea = all;
                }
                field(StationName; Rec.StationName)
                {
                    Caption = 'StationName';
                    ApplicationArea = all;
                }
                field(SubDepartmentId; Rec.SubDepartmentId)
                {
                    Caption = 'SubDepartmentId';
                    ApplicationArea = all;
                }
                field(SubDepartmentName; Rec.SubDepartmentName)
                {
                    Caption = 'SubDepartmentName';
                    ApplicationArea = all;
                }
                field(DepartmentID; Rec.DepartmentID)
                {
                    Caption = 'DepartmentID';
                    ApplicationArea = all;
                }
                field(DepartmentName; Rec.DepartmentName)
                {
                    Caption = 'DepartmentName';
                    ApplicationArea = all;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = all;
                }
                field("Item Category Name"; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                    ApplicationArea = all;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = all;
                }
                field("HIS Module"; Rec."HIS Module")
                {
                    Caption = 'HIS Module';
                    ApplicationArea = all;
                }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                    ApplicationArea = all;
                }
                field("HIS Bill Type"; Rec."HIS Bill Type")
                {
                    Caption = 'HIS Bill Type';
                    ApplicationArea = all;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Caption = 'Account Type';
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    ApplicationArea = all;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ApplicationArea = all;
                }

                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ApplicationArea = all;
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    Caption = 'Bal. Account No';
                    ApplicationArea = all;
                }

                field("Amount"; Rec."Amount")
                {
                    Caption = 'Amount';
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Revenue Entries")
            {
                ApplicationArea = All;
                Image = CreateLedgerBudget;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    HISPharmacyPost: Codeunit "3E HIS Integration Mgmt.";
                begin
                    HISPharmacyPost.InitGenJnlLineRevenueStaging();

                end;
            }
            action("Post Revenue Entries")
            {
                ApplicationArea = All;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    HISPharmacyPost: Codeunit "3E HIS Integration Mgmt.";
                begin

                    HISPharmacyPost.PostGenJnlLineEntries();
                end;
            }
        }

    }

    trigger OnOpenPage()
    var
        GLAccount: Record "G/L Account";
        RecBank: Record "Bank Account";
    begin
        if (rec."Account Type" = Rec."Account Type"::"G/L Account") and (rec."GL Account Name" = '') then begin
            IF GLAccount.Get(Rec."Account No.") then;
            Rec."GL Account Name" := GLAccount.Name;
        end;

        if (Rec."Account Type" = Rec."Account Type"::"Bank Account") and (rec."GL Account Name" = '') then begin
            IF RecBank.Get(Rec."Account No.") then;
            Rec."GL Account Name" := RecBank.Name;
        end;
    End;

    trigger OnAfterGetRecord()
    var
        GLAccount: Record "G/L Account";
        RecBank: Record "Bank Account";
    begin
        if (rec."Account Type" = Rec."Account Type"::"G/L Account") and (rec."GL Account Name" = '') then begin
            IF GLAccount.Get(Rec."Account No.") then;
            Rec."GL Account Name" := GLAccount.Name;
        end;

        if (Rec."Account Type" = Rec."Account Type"::"Bank Account") and (rec."GL Account Name" = '') then begin
            IF RecBank.Get(Rec."Account No.") then;
            Rec."GL Account Name" := RecBank.Name;
        end;
    end;

}
