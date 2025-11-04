tableextension 50001 "3E HIS G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(50000; "3E UTR No."; Code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'UTR No.';
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
        field(50003; "3E Store Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Code';
        }
        field(50004; "3E Sub Group Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sub Group Code';
        }
        field(50005; "3E Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
        }
        field(50006; "3E UHID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'UHID';
        }
        field(50007; "3E Patient Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Patient Name';
        }
        field(50008; "3E Validation Key"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Validation Key';
        }
        field(50009; "3E Narration"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Narration';
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
    }
}