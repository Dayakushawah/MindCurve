page 50082 "3E Settlement API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3ESettlementAPI';
    DelayedInsert = true;
    EntityName = 'settlement';
    EntitySetName = 'settlements';
    PageType = API;
    SourceTable = "3E HIS Settlement Staging";
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
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(patientName; Rec."Patient Name")
                {
                    Caption = 'Patient Name';
                }
                field(uhid; Rec.UHID)
                {
                    Caption = 'UHID';
                }
                field(encounterNo; Rec."Encounter No.")
                {
                    Caption = 'Encounter No.';
                }
                field(hisDocumentType; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(balaccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(balaccountNo; Rec."Bal. Account No")
                {
                    Caption = 'Bal. Account No.';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(chequeNo; Rec."Cheque No.")
                {
                    Caption = 'Cheque No.';
                }
                field(chequeDate; Rec."Cheque Date")
                {
                    Caption = 'Cheque Date';
                }
                field(validationHISKey; Rec."Validation HIS Key")
                {
                    Caption = 'Validation HIS Key';
                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                field(hisUserID; Rec."HIS User ID")
                {
                    Caption = 'HIS User ID';
                }
                field(hisUserName; Rec."HIS User Name")
                {
                    Caption = 'HIS User Name';
                }
                field(modeOfPayment; Rec."Mode of Payment")
                {
                    Caption = 'Mode of Payment';
                }
                field(sponsorCode; Rec."Sponsor Code")
                {
                    Caption = 'Sponsor Code';
                }
                field(sponsorName; Rec."Sponsor Name")
                {
                    Caption = 'Sponsor Name';
                }
                field(payerName; Rec."Payer Name")
                {
                    Caption = 'Payer Name';
                }
                field(payorCategory; Rec."Payor Category")
                {
                    Caption = 'Payor Category';
                }
                field(settlementType; Rec.SettlementType)
                {
                    Caption = 'SettlementType';
                }
            }
        }
    }

    local procedure DuplicateCheck()
    var
        SettlementStaging: Record "3E HIS Settlement Staging";
    begin
        SettlementStaging.SetRange("HIS Document Type", Rec."HIS Document Type");
        SettlementStaging.SetRange("Validation HIS Key", Rec."Validation HIS Key");
        if not SettlementStaging.IsEmpty then
            error('Duplicate Entry');
    end;

}
