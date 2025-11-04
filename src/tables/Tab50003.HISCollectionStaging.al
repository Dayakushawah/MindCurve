table 50003 "3E HIS Revenue Staging Table"
{
    Caption = 'HIS Revenue Staging Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(3; "HIS Module"; Text[30])
        {
            Caption = 'HIS Module';
            DataClassification = CustomerContent;
        }
        field(4; "HIS Document Type"; Text[60])
        {
            Caption = 'HIS Document Type';
            DataClassification = CustomerContent;
        }
        field(5; "HIS Bill Type"; Text[3])
        {
            Caption = 'HIS Bill Type';
            DataClassification = CustomerContent;
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(7; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(8; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(9; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(10; "External Document No."; Code[30])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(11; "Receipt No."; Text[30])
        {
            Caption = 'Receipt No.';
            DataClassification = CustomerContent;
        }
        field(12; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(13; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal. Account Type';
            DataClassification = CustomerContent;
        }
        field(14; "Bal. Account No"; Code[20])
        {
            Caption = 'Bal. Account No';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                               Blocked = CONST(false))
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Bal. Account Type" = CONST(Employee)) Employee;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(15; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(16; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(17; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(18; "Cheque No."; Code[30])
        {
            Caption = 'Cheque No.';
            DataClassification = CustomerContent;
        }
        field(19; "Cheque Date"; Date)
        {
            Caption = 'Cheque Date';
            DataClassification = CustomerContent;
        }
        field(20; "Line Narration"; Text[150])
        {
            Caption = 'Line Narration';
            DataClassification = CustomerContent;
        }
        field(21; UHID; Code[20])
        {
            Caption = 'UHID';
            DataClassification = CustomerContent;
        }
        field(22; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = CustomerContent;
        }
        field(23; "Admission Date Time"; DateTime)
        {
            Caption = 'Admission Date Time';
            DataClassification = CustomerContent;
        }
        field(24; "Discharge Date Time"; DateTime)
        {
            Caption = 'Discharge Date Time';
            DataClassification = CustomerContent;
        }
        field(25; "Package Patient"; Boolean)
        {
            Caption = 'Package Patient';
            DataClassification = CustomerContent;
        }
        field(26; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(27; "General Entries Created"; Boolean)
        {
            Caption = 'General Entries Created';
            DataClassification = CustomerContent;
        }
        field(28; "Error Description"; Text[100])
        {
            Caption = 'Error Description';
            DataClassification = CustomerContent;
        }
        field(29; "Validation HIS Key"; Code[50])
        {
            Caption = 'Validation HIS Key';
            DataClassification = CustomerContent;
        }
        field(30; "General Template Code"; Code[10])
        {
            Caption = 'General Template Code';
            TableRelation = "Gen. Journal Template";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(31; "General Batch Code"; Code[10])
        {
            Caption = 'General Batch Code';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("General Template Code"));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(32; "Store Code"; Code[10])
        {
            Caption = 'Store Code';
            DataClassification = CustomerContent;
        }
        field(33; "Sub Group"; Code[10])
        {
            Caption = 'Sub Group';
            DataClassification = CustomerContent;
        }
        field(34; "Posted Entry No"; Integer)
        {
            Caption = 'Posted Entry No';
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Entry"."Entry No." WHERE("Document No." = FIELD("Document No.")));
        }
        field(35; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }
        field(36; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
            DataClassification = CustomerContent;
        }
        field(38; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50; TRANSACTION_TYPE; Text[50])
        {
            Caption = 'TRANSACTION_TYPE';
            DataClassification = CustomerContent;
        }
        field(100; "Encounter No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Encounter No.';
        }
        field(101; "HIS User ID"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS User ID';
        }
        field(102; "HIS User Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'HIS User Name';
        }
        field(103; "Mode of Payment"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mode of Payment';
        }
        field(104; "Sponsor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Code';
        }
        field(105; "Sponsor Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Sponsor Name';
        }
        field(106; "Payer Code"; Code[16])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Code';
        }
        field(107; "Payer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Payer Name';
        }
        field(108; "Payor Category"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Payor Category';
        }
        field(109; "IP No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'IP No.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
