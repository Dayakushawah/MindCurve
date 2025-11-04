page 50060 "3E Revenue HDR API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eRevenueHDRAPI';
    DelayedInsert = true;
    EntityName = 'revenueheader';
    EntitySetName = 'revenueheaders';
    PageType = API;
    SourceTable = "3E HIS Revenue Header";
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

                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(hisDocumentType; Rec."HIS Document Type")
                {
                    Caption = 'HIS Document Type';
                }
                field(patientName; Rec."Patient Name")
                {
                    Caption = 'Patient Name';
                }
                field(UHID; Rec.UHID)
                {
                    Caption = 'UHID';
                }
                field(encounterNo; Rec."Encounter No.")
                {
                    Caption = 'Encounter No.';
                }
                field(doctor; Rec.Doctor)
                {
                    Caption = 'Doctor';
                }
                field(speciality; Rec.Speciality)
                {
                    Caption = 'Speciality';
                }
                field(sponsorCode; Rec."Sponsor Code")
                {
                    Caption = 'Sponsor Code';
                }
                field(sponsorName; Rec."Sponsor Name")
                {
                    Caption = 'Sponsor Name';
                }
                field(payerCode; Rec."Payer Code")
                {
                    Caption = 'Payer Code';
                }
                field(payorCategory; Rec."Payor Category")
                {
                    Caption = 'Payor Category';
                }
                field(payerName; Rec."Payer Name")
                {
                    Caption = 'Payer Name';
                }
                field(admissionDateTime; Rec."Admission Date Time")
                {
                    Caption = 'Admission Date Time';
                }
                field(dischargeDateTime; Rec."Discharge Date Time")
                {
                    Caption = 'Discharge Date Time';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(validationHISKey; Rec."Validation HIS Key")
                {
                    Caption = 'Validation HIS Key';
                }
                field(admissionSource; Rec."Admission Source")
                {
                    Caption = 'Admission Source';
                }
                field(packagePatient; Rec."Package Patient")
                {
                    Caption = 'Package Patient';
                }
                field(admissionBedCategory; Rec."Admission Bed Category")
                {
                    Caption = 'Admission Bed Category';
                }
                field(dischargeBedCategory; Rec."Discharge Bed Category")
                {
                    Caption = 'Discharge Bed Category';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(patientPayable; Rec."Patient Payable")
                {
                    Caption = 'Patient Payable';
                }
                field(payorPayable; Rec."Payor Payable")
                {
                    Caption = 'Payor Payable';
                }
                field(noOfLines; Rec."No. of Lines")
                {
                    Caption = 'No. of Lines';
                }
                field(specialityCode; Rec."Speciality Code")
                {
                    Caption = 'Speciality Code';
                }

            }
            part(RevenueLine; "3E Revenue Line API")
            {
                Caption = 'Lines';
                EntityName = 'revenueline';
                EntitySetName = 'revenuelines';
                SubPageLink = "Record Type" = field("Record Type"), "Document Type" = field("Document Type"), "Document No." = field("Document No.");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Validate("Record Type", Rec."Record Type"::Revenue);
        Rec."Document Type" := Rec."Document Type"::Invoice;
        //DuplicateCheck();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Validate("Record Type", Rec."Record Type"::Revenue);
        Rec."Document Type" := Rec."Document Type"::Invoice;
        //DuplicateCheck();
    end;

    local procedure DuplicateCheck()
    var
        RevenueHeader: Record "3E HIS Revenue Header";
    begin
        //RevenueHeader.SetFilter("Entry No.", '<>%1', Rec."Entry No.");
        RevenueHeader.Setrange("Record Type", Rec."Record Type"::Revenue);
        RevenueHeader.Setrange("Document Type", Rec."Document Type"::Invoice);
        RevenueHeader.SetRange("Document No.", Rec."Document No.");
        //if not RevenueHeader.IsEmpty then
        if RevenueHeader.Count >= 1 then
            error('Duplicate Entry');
    end;
}
