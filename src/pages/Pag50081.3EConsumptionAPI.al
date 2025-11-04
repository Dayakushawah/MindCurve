page 50081 "3E Consumption API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3EConsumptionAPI';
    DelayedInsert = true;
    EntityName = 'consumption';
    EntitySetName = 'consumptions';
    PageType = API;
    SourceTable = "3E HIS Consumption Entries";
    ODataKeyFields = SystemId;
    Extensible = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(hisDocumentType; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                }
                field(validationHISKey; Rec."Validation HIS Key")
                {
                    Caption = 'Validation HIS Key';
                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(uhid; Rec.UHID)
                {
                    Caption = 'UHID';
                }
                field(patientName; Rec."Patient Name")
                {
                    Caption = 'Patient Name';
                }
                field(departmentID; Rec.DepartmentID)
                {
                    Caption = 'DepartmentID';
                }
                field(departmentName; Rec.DepartmentName)
                {
                    Caption = 'DepartmentName';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(itemCategoryName; Rec."Item Category Name")
                {
                    Caption = 'Item Category Name';
                }
                field(itemSubCategory; Rec."Product Group Code")
                {
                    Caption = 'Item Sub Category';
                }
                field(subGroup; Rec."Sub Group")
                {
                    Caption = 'Sub Group';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(itemID; Rec.ITEM_ID)
                {
                    Caption = 'ITEM_ID';
                }
                field(itemNAME; Rec.ITEM_NAME)
                {
                    Caption = 'ITEM_NAME';
                }
                field(quantity; Rec.QUANTITY)
                {
                    Caption = 'QUANTITY';
                }
                field(price; Rec.PRICE)
                {
                    Caption = 'PRICE';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(balAccountNo; Rec."Bal. Account No")
                {
                    Caption = 'Bal. Account No';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(lineNarration; Rec."Line Narration")
                {
                    Caption = 'Line Narration';
                }
                field(speciality; Rec.Speciality)
                {
                    Caption = 'Speciality';
                }
                field(issueReturnFlag; Rec."Issue/Return Flag")
                {
                    Caption = 'Issue/Return Flag';
                }
            }
        }
    }

    local procedure DuplicateCheck()
    var
        ConsumptionStaging: Record "3E HIS Consumption Entries";
    begin
        //ConsumptionStaging.SetFilter("Entry No.", '<>%1', Rec."Entry No.");
        ConsumptionStaging.SetRange("HIS Document Type", Rec."HIS Document Type");
        ConsumptionStaging.SetRange("Validation HIS Key", Rec."Validation HIS Key");
        if not ConsumptionStaging.IsEmpty then
            error('Duplicate Entry');
    end;

}
