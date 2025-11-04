table 50011 "3E HIS Revenue Header"
{
    Caption = 'HIS Revenue Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            BlankZero = true;
            MinValue = 1;

            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(2; "Record Type"; Option)
        {
            Caption = 'Record Type';
            OptionMembers = ,Revenue,"Revenue Cancel";
            DataClassification = ToBeClassified;
        }
        field(3; "HIS Document Type"; Text[100])
        {
            Caption = 'HIS Document Type';
            DataClassification = ToBeClassified;
        }
        field(4; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = ,Invoice,"Credit Memo";
            DataClassification = ToBeClassified;
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = ToBeClassified;
        }
        field(8; "UHID"; Code[50])
        {
            Caption = 'UHID';
            DataClassification = ToBeClassified;
        }
        field(9; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = "Customer";
            ValidateTableRelation = false;
            trigger OnValidate()
            begin
                "Customer Name" := '';
                Customer.Get("Customer No.");
                "Customer Name" := Customer.Name;

            end;

        }
        field(10; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(11; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }
        field(12; "Validation HIS Key"; Text[100])
        {
            Caption = 'Validation HIS Key';
            DataClassification = ToBeClassified;
        }
        field(13; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(14; "Encounter No."; Code[50])
        {
            Caption = 'Encounter No.';
            DataClassification = ToBeClassified;
        }
        field(15; "No. of Lines"; Integer)
        {
            Caption = 'No. of Lines';
            DataClassification = ToBeClassified;
        }
        field(16; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(17; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(18; "Doctor"; Text[100])
        {
            Caption = 'Doctor';
            DataClassification = ToBeClassified;
        }
        field(19; "Speciality"; Text[50])
        {
            Caption = 'Speciality';
            DataClassification = ToBeClassified;
        }
        field(20; "Sponsor Code"; Code[20])
        {
            Caption = 'Sponsor Code';
            DataClassification = ToBeClassified;
        }
        field(21; "Sponsor Name"; Text[100])
        {
            Caption = 'Sponsor Name';
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(23; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(24; "Gen. Journal Template Code"; Code[20])
        {
            Caption = 'Gen. Journal Template Code';
            TableRelation = "Gen. Journal Template";
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(25; "Admission Date Time"; DateTime)
        {
            Caption = 'Admission Date Time';
            DataClassification = ToBeClassified;
        }
        field(26; "Discharge Date Time"; DateTime)
        {
            Caption = 'Discharge Date Time';
            DataClassification = ToBeClassified;
        }
        field(27; "Create Revenue"; Boolean)
        {
            Caption = 'Create Revenue';
            DataClassification = ToBeClassified;
        }
        field(28; "Posted Revenue No."; Code[20])
        {
            Caption = 'Posted Revenue No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."No." WHERE("Sell-to Customer No." = field("Customer No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(29; "Submitted Date Time"; DateTime)
        {
            Caption = 'Submitted Date Time';
            DataClassification = ToBeClassified;
        }
        field(30; "Submitted By"; Code[50])
        {
            Caption = 'Submitted By';
            DataClassification = ToBeClassified;
        }
        field(31; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Vendor,Customer;
            OptionCaption = ' ,,Customer';
            DataClassification = CustomerContent;
            InitValue = Customer;
        }
        field(32; "Reference Invoice No."; Code[20])
        {
            Caption = 'Reference Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(33; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(34; "Admission Source"; Text[60])
        {
            Caption = 'Admission Source';
            DataClassification = ToBeClassified;
        }
        field(35; "Package Patient"; Boolean)
        {
            Caption = 'Package Patient';
            DataClassification = ToBeClassified;
        }
        field(36; "Admission Bed Category"; Text[50])
        {
            Caption = 'Admission Bed Category';
            DataClassification = ToBeClassified;
        }
        field(37; "Discharge Bed Category"; Text[50])
        {
            Caption = 'Discharge Bed Category';
            DataClassification = ToBeClassified;
        }
        field(38; "Posted Document No."; Code[20])
        {
            Caption = 'Posted Document No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Entry"."Document No." WHERE("External Document No." = field("External Document No.")//, "3E Payer Code" = field("Payer Code")
            ));
            Editable = false;
        }
        field(39; "Patient Payable"; Decimal)
        {
            Caption = 'Patient Payable';
            DataClassification = ToBeClassified;
        }
        field(40; "Payor Payable"; Decimal)
        {
            Caption = 'Payor Payable';
            DataClassification = ToBeClassified;
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
        field(109; "Error Description"; Text[100])
        {
            Caption = 'Error Description';
            DataClassification = CustomerContent;
        }
        field(110; "Error 1"; Boolean)
        {
            Caption = 'Error 1';
            DataClassification = CustomerContent;
        }
        field(111; "Error 2"; Boolean)
        {
            Caption = 'Error 2';
            DataClassification = CustomerContent;
        }
        field(112; "Error 3"; Boolean)
        {
            Caption = 'Error 3';
            DataClassification = CustomerContent;
        }
        field(113; "Error 4"; Boolean)
        {
            Caption = 'Error 4';
            DataClassification = CustomerContent;
        }
        field(114; "Speciality Code"; Code[20])
        {
            Caption = 'Speciality Code';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Entry No.", "Record Type", "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        RevLine: Record "3E HIS Revenue Line";
    begin
        RevLine.SetRange("Record Type", Rec."Record Type");
        RevLine.SetRange("Document Type", Rec."Document Type");
        RevLine.SetRange("Document No.", Rec."Document No.");
        RevLine.DeleteAll();
    end;

    var
        Customer: RECORD CUSTOMER;

}
