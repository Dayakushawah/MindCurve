table 50017 "3E HIS Indent Header"
{
    Caption = 'HIS Purchase/Sales Header';
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
            OptionMembers = ,Purchase,"Purchase Return",Sales,"Sales Return";
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
        field(7; "Indent Order No."; Code[20])
        {
            Caption = 'Indent Order No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Indent Order Date"; Date)
        {
            Caption = 'Purchase Order Date';
            DataClassification = ToBeClassified;
        }
        field(9; "Vendor/Customer No."; Code[20])
        {
            Caption = 'Vendor/Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Type = const(Vendor)) "Vendor"
            else
            if (Type = const(Customer)) "Customer";
            ValidateTableRelation = false;
            trigger OnValidate()
            begin
                "Vendor/Customer Name" := '';
                IF Type = Type::Vendor then begin
                    Vendor.Get("Vendor/Customer No.");
                    "Vendor/Customer Name" := Vendor.Name
                end;
                IF Type = Type::Customer then begin
                    Customer.Get("Vendor/Customer No.");
                    "Vendor/Customer Name" := Customer.Name
                end;

            end;

        }
        field(10; "Vendor/Customer Name"; Text[100])
        {
            Caption = 'Vendor/Customer Name';
            DataClassification = ToBeClassified;
        }
        field(11; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(12; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
            DataClassification = ToBeClassified;
        }
        field(13; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(14; "Indent ID"; Code[20])
        {
            Caption = 'Indent ID';
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
            DataClassification = ToBeClassified;
        }
        field(18; "Error 1"; Boolean)
        {
            Caption = 'Error 1';
            DataClassification = ToBeClassified;
        }
        field(19; "Error 2"; Boolean)
        {
            Caption = 'Error 2';
            DataClassification = ToBeClassified;
        }
        field(20; "Error 3"; Boolean)
        {
            Caption = 'Error 3';
            DataClassification = ToBeClassified;
        }
        field(21; "Error 4"; Boolean)
        {
            Caption = 'Error 4';
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;
        }
        field(23; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = ToBeClassified;
        }
        field(24; "Gen. Journal Template Code"; Code[20])
        {
            Caption = 'Gen. Journal Template Code';
            TableRelation = "Gen. Journal Template";
            DataClassification = ToBeClassified;
        }
        field(25; "Error Description"; Text[100])
        {
            Caption = 'Error Description';
            DataClassification = ToBeClassified;
        }
        field(26; "Create PO"; Boolean)
        {
            Caption = 'Create PO';
            DataClassification = ToBeClassified;
        }
        field(27; "Posted Indent No."; Code[20])
        {
            Caption = 'Posted Sales Indent No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."No." WHERE("Sell-to Customer No." = field("Vendor/Customer No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(28; "Submitted Date Time"; DateTime)
        {
            Caption = 'Submitted Date Time';
            DataClassification = ToBeClassified;
        }
        field(29; "Submitted By"; Code[50])
        {
            Caption = 'Submitted By';
            DataClassification = ToBeClassified;
        }
        field(30; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(31; "Creation Date Time"; DateTime)
        {
            Caption = 'Creation Date Time';
            DataClassification = ToBeClassified;
        }
        field(32; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Vendor,Customer;
            DataClassification = ToBeClassified;
        }
        field(33; "Reference No."; Code[20])
        {
            Caption = 'Reference No.';
            DataClassification = ToBeClassified;
        }
        field(34; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = ToBeClassified;
        }
        field(35; "Station Name"; Text[60])
        {
            Caption = 'Station Name';
            DataClassification = ToBeClassified;
        }
        field(36; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(37; Remarks; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(38; "Integration PO Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Posted Cr.Memo No."; Code[20])
        {
            Caption = 'Posted Cr.Memo No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Cr.Memo Header"."No." WHERE("Sell-to Customer No." = field("Vendor/Customer No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(40; "Posted Purchase Inv No."; Code[20])
        {
            Caption = 'Posted Purchase Inv No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Inv. Header"."No." WHERE("Buy-from Vendor No." = field("Vendor/Customer No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(41; "Posted Pur Cr.Memo No."; Code[20])
        {
            Caption = 'Posted Pur Cr.Memo No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."No." WHERE("Buy-from Vendor No." = field("Vendor/Customer No."), "No." = field("Document No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Record Type", "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    var
        Vendor: Record Vendor;
        Customer: RECORD CUSTOMER;

}
