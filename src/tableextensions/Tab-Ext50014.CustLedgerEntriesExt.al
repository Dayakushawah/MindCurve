tableextension 50014 "3E HIS Cust. Ledger Entries" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "3E HIS Module"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Module';
        }
        field(50001; "3E HIS Document Type"; Text[60])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Document Type';
        }
        field(50002; "3E Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
        }
        field(50003; "3E UHID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'UHID';
        }
        field(50004; "3E Patient Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Patient Name';
        }
        field(50005; "3E Encounter No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(50006; "3E Doctor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Doctor Name';
        }
        field(50007; "3E Speciality"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Speciality';
        }
        field(50008; "3E Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(50009; "3E Sponsor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(50010; "3E Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(50011; "3E Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }

    }
}
