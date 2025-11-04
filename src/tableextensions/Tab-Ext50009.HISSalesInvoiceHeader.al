tableextension 50009 "3E HIS Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "3E RCM"; Boolean)
        {
            Caption = 'RCM';
            DataClassification = CustomerContent;
        }
        field(50001; "3E HIS Module"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Module';
        }
        field(50002; "3E HIS Document Type"; Text[60])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS Document Type';
        }
        field(50003; "3E Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
        }
        field(50004; "3E UHID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'UHID';
        }
        field(50005; "3E Patient Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Patient Name';
        }
        field(50006; "3E Encounter No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(50007; "3E Doctor Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Doctor Name';
        }
        field(50008; "3E Speciality"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Speciality';
        }
        field(50009; "3E Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(50010; "3E Sponsor Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(50011; "3E Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(50012; "3E Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }
        field(50013; "Indent Amount"; Decimal)
        {
            Caption = 'Indent Amount';
            DataClassification = ToBeClassified;
        }
        field(50014; "Station Name"; Text[60])
        {
            Caption = 'Station Name';
            DataClassification = ToBeClassified;
        }
    }
}
