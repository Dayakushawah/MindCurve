tableextension 50000 "3E Gen. Journal Line Exts" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "3E UTR No."; Code[35])
        {
            Caption = 'UTR No.';
            DataClassification = CustomerContent;
        }
        field(50001; "3E HIS Module"; Text[30])
        {
            Caption = 'HIS Module';
            DataClassification = CustomerContent;
        }
        field(50002; "3E HIS Document Type"; Text[60])
        {
            Caption = 'HIS Document Type';
            DataClassification = CustomerContent;
        }
        field(50003; "3E Store Code"; Code[10])
        {
            Caption = 'Store Code';
            DataClassification = CustomerContent;
        }
        field(50004; "3E Sub Group Code"; Code[10])
        {
            Caption = 'Sub Group Code';
            DataClassification = CustomerContent;
        }
        field(50005; "3E Receipt No."; Code[20])
        {
            Caption = 'Receipt No.';
            DataClassification = CustomerContent;
        }
        field(50006; "3E UHID"; Code[20])
        {
            Caption = 'UHID';
            DataClassification = CustomerContent;
        }
        field(50007; "3E Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = CustomerContent;
        }
        field(50008; "3E Validation Key"; Text[50])
        {
            Caption = 'Vaidation Key';
            DataClassification = CustomerContent;
        }
        field(50009; "3E Narration"; Text[150])
        {
            Caption = 'Narrantion';
            DataClassification = CustomerContent;
        }
        field(50010; "3E Transaction Type"; Text[50])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(50011; "3E Encounter No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(50012; "3E Doctor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Doctor Name';
        }
        field(50013; "3E Speciality"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Speciality';
        }
        field(50014; "3E Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(50015; "3E Sponsor Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(50016; "3E Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(50017; "3E Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }
        field(50018; "Cheque No."; Code[30])
        {
            Caption = 'Cheque No.';
            DataClassification = CustomerContent;
        }
        field(50019; "Cheque Date"; Date)
        {
            Caption = 'Cheque Date';
            DataClassification = CustomerContent;
        }


    }
}