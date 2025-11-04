table 50005 "3E HIS Purchase Header"
{
    Caption = 'HIS Purchase Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            BlankZero = true;
            MinValue = 1;

            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; "Record Type"; Option)
        {
            Caption = 'Record Type';
            OptionMembers = ,GRN,"GRN Return";
            DataClassification = CustomerContent;
        }
        field(3; "HIS Document Type"; Text[100])
        {
            Caption = 'HIS Document Type';
            DataClassification = CustomerContent;
        }
        field(4; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = ,Order,"Return Order";
            DataClassification = CustomerContent;
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(6; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(7; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = CustomerContent;
        }
        field(8; "Purchase Order Date"; Date)
        {
            Caption = 'Purchase Order Date';
            DataClassification = CustomerContent;
        }
        field(9; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = "Vendor";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                "Vendor Name" := '';
                if Vendor.Get("Vendor No.") then
                    "Vendor Name" := Vendor.Name;
            end;

        }
        field(10; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
        }
        field(11; "Vendor Invoice No."; Code[20])
        {
            Caption = 'Vendor Invoice No.';
            DataClassification = CustomerContent;
        }
        field(12; "Vendor Invoice Date"; Date)
        {
            Caption = 'Vendor Invoice Date';
            DataClassification = CustomerContent;
        }
        field(13; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(14; "GRN ID"; Code[20])
        {
            Caption = 'GRN ID';
            DataClassification = CustomerContent;
        }
        field(15; "No. of Lines"; Integer)
        {
            Caption = 'No. of Lines';
            DataClassification = CustomerContent;
        }
        field(16; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(17; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(18; "Error 1"; Boolean)
        {
            Caption = 'Error 1';
            DataClassification = CustomerContent;
        }
        field(19; "Error 2"; Boolean)
        {
            Caption = 'Error 2';
            DataClassification = CustomerContent;
        }
        field(20; "Error 3"; Boolean)
        {
            Caption = 'Error 3';
            DataClassification = CustomerContent;
        }
        field(21; "Error 4"; Boolean)
        {
            Caption = 'Error 4';
            DataClassification = CustomerContent;
        }
        field(22; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(23; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(24; "Gen. Journal Template Code"; Code[20])
        {
            Caption = 'Gen. Journal Template Code';
            TableRelation = "Gen. Journal Template";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(25; "Error Description"; Text[100])
        {
            Caption = 'Error Description';
            DataClassification = CustomerContent;
        }
        field(26; "Create PO"; Boolean)
        {
            Caption = 'Create PO';
            DataClassification = CustomerContent;
        }
        field(27; "Posted Order No."; Code[20])
        {
            Caption = 'Posted Order No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Inv. Header"."No." WHERE("Buy-from Vendor No." = field("Vendor No."), "No." = field("Document No.")));
            Editable = false;
        }

        field(28; "Capex Type"; Enum "3E Capex Type")
        {
            Caption = 'Capex Type';
            DataClassification = CustomerContent;
        }
        field(29; "Submitted Date Time"; DateTime)
        {
            Caption = 'Submitted Date Time';
            DataClassification = CustomerContent;
        }
        field(30; "Submitted By"; Code[50])
        {
            Caption = 'Submitted By';
            DataClassification = CustomerContent;
        }
        field(31; "SQL Created By"; Code[50])
        {
            Caption = 'SQL Created By';
            DataClassification = CustomerContent;
        }
        field(32; "SQL Creation Date Time"; DateTime)
        {
            Caption = 'SQL Creation Date Time';
            DataClassification = CustomerContent;
        }
        field(33; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Vendor,Customer;
            OptionCaption = ' ,Vendor';
            DataClassification = CustomerContent;
            InitValue = Vendor;
        }
        field(34; "Reference Invoice No."; Code[20])
        {
            Caption = 'Reference Invoice No.';
            DataClassification = CustomerContent;
        }
        field(35; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(36; "Address Code"; Code[10])
        {
            Caption = 'Address Code';
            TableRelation = "Order Address".Code where("Vendor No." = field("Vendor No."));
            //ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(37; "Posted Cr.Memo No."; Code[20])
        {
            Caption = 'Posted Cr.Memo No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."No." WHERE("Buy-from Vendor No." = field("Vendor No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(38; "Store Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Name';
        }
        field(39; "FI Posting Date"; Date)
        {
            Caption = 'FI Posting Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Inv. Header"."Posting Date" WHERE("Buy-from Vendor No." = field("Vendor No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(40; "FIC Posting Date"; Date)
        {
            Caption = 'FIC Posting Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Cr. Memo Hdr."."Posting Date" WHERE("Buy-from Vendor No." = field("Vendor No."), "No." = field("Document No.")));
            Editable = false;
        }
        field(41; "Item Type"; Enum "3E HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
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

    trigger OnDelete()
    var
        GRNLines: Record "3E HIS Purchase Line";
    begin
        GRNLines.SetRange("Record Type", Rec."Record Type");
        GRNLines.SetRange("Document Type", rec."Document Type");
        GRNLines.SetRange("Document No.", Rec."Document No.");
        GRNLines.DeleteAll(false);
    end;
}
