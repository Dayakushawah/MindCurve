table 50008 "3E HIS Pharmacy Entries"
{
    Caption = 'HIS Pharmacy Entries';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(3; HSPLOCATIONID; Code[20])
        {
            Caption = 'HSPLOCATIONID';
            DataClassification = CustomerContent;
        }
        field(4; ORGANIZATION_NAME; Text[100])
        {
            Caption = 'ORGANIZATION_NAME';
            DataClassification = CustomerContent;
        }
        field(5; EPISODE; Text[50])
        {
            Caption = 'EPISODE';
            DataClassification = CustomerContent;
        }
        field(6; TRANSACTION_TYPE; Text[50])
        {
            Caption = 'TRANSACTION_TYPE';
            DataClassification = CustomerContent;
        }
        field(7; UHID; Code[50])
        {
            Caption = 'UHID';
            DataClassification = CustomerContent;
        }
        field(8; "PATIENT_NAMES"; Text[100])
        {
            Caption = 'PATIENT NAME';
            DataClassification = CustomerContent;
        }
        field(9; BILL_AMOUNT; Decimal)
        {
            Caption = 'BILL_AMOUNT';
            DataClassification = CustomerContent;
        }
        field(10; SERVICE_ID; Code[20])
        {
            Caption = 'SERVICE_ID';
            DataClassification = CustomerContent;
        }
        field(11; SERVICE_NAME; Text[100])
        {
            Caption = 'SERVICE_NAME';
            DataClassification = CustomerContent;
        }
        field(12; ITEM_ID; Code[20])
        {
            Caption = 'ITEM_ID';
            DataClassification = CustomerContent;
        }
        field(13; ITEM_NAME; Text[100])
        {
            Caption = 'ITEM_NAME';
            DataClassification = CustomerContent;
        }
        field(14; QUANTITY; Decimal)
        {
            Caption = 'QUANTITY';
            DataClassification = CustomerContent;
        }
        field(15; "Receipt No."; Text[20])
        {
            Caption = 'Receipt No.';
            DataClassification = CustomerContent;
        }
        field(16; PRICE; Decimal)
        {
            Caption = 'PRICE';
            DataClassification = CustomerContent;
        }
        field(17; "VAT %"; Decimal)
        {
            Caption = 'GST %';
            DataClassification = CustomerContent;
        }
        field(18; "Store Code"; Text[50])
        {
            Caption = 'Store Code';
            DataClassification = CustomerContent;
        }
        field(19; DISCOUNT_AMOUNT; Decimal)
        {
            Caption = 'DISCOUNT_AMOUNT';
            DataClassification = CustomerContent;
        }
        field(20; Stationid; Code[20])
        {
            Caption = 'Stationid';
            DataClassification = CustomerContent;
        }
        field(21; StationName; Text[100])
        {
            Caption = 'StationName';
            DataClassification = CustomerContent;
        }
        field(22; SubDepartmentId; Code[20])
        {
            Caption = 'SubDepartmentId';
            DataClassification = CustomerContent;
        }
        field(23; SubDepartmentName; Text[100])
        {
            Caption = 'SubDepartmentName';
            DataClassification = CustomerContent;
        }
        field(24; DepartmentID; Code[20])
        {
            Caption = 'DepartmentID';
            DataClassification = CustomerContent;
        }
        field(25; DepartmentName; Text[100])
        {
            Caption = 'DepartmentName';
            DataClassification = CustomerContent;
        }
        field(26; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = CustomerContent;
        }
        field(27; "Item Category Name"; Text[100])
        {
            Caption = 'Item Category Name';
            DataClassification = CustomerContent;
        }
        field(28; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(29; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(30; "HIS Module"; Text[30])
        {
            Caption = 'HIS Module';
            DataClassification = CustomerContent;
        }
        field(31; "HIS Document Type"; Text[60])
        {
            Caption = 'HIS Document Type';
            DataClassification = CustomerContent;
        }
        field(32; "HIS Bill Type"; Text[3])
        {
            Caption = 'HIS Bill Type';
            DataClassification = CustomerContent;
        }
        field(33; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(34; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(35; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(36; "Account No."; Code[20])
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
            DataClassification = CustomerContent;
        }
        field(37; "External Document No."; Code[30])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }

        field(38; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal. Account Type';
            DataClassification = CustomerContent;
        }
        field(39; "Bal. Account No"; Code[20])
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
            DataClassification = CustomerContent;
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;
        }
        field(50; "General Entries Created"; Boolean)
        {
            Caption = 'General Entries Created';
            DataClassification = CustomerContent;
        }
        field(51; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(52; "General Template Code"; Code[20])
        {
            Caption = 'General Template Code';
            DataClassification = CustomerContent;
        }
        field(53; "General Batch Code"; Code[20])
        {
            Caption = 'General Batch Code';
            DataClassification = CustomerContent;
        }
        field(54; "Created By"; code[50])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;

        }
        field(55; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
            DataClassification = CustomerContent;

        }
        field(56; "Line Narration"; Text[50])
        {
            Caption = 'Line Narration';
            DataClassification = CustomerContent;

        }
        field(57; "Product Group Code"; Code[20])
        {
            Caption = 'Product Group Code';
            DataClassification = CustomerContent;
        }
        field(58; "Product Group Name"; Text[60])
        {
            Caption = 'Product Group Name';
            DataClassification = CustomerContent;
        }

        field(59; "Patient Name"; Text[50])
        {
            Caption = 'Patient Name';
            DataClassification = CustomerContent;
        }
        field(60; "GL Account Name"; Text[50])
        {
            Caption = 'GL Account Name';
            DataClassification = CustomerContent;
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
