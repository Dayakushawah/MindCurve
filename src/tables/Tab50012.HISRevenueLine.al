table 50012 "3E HIS Revenue Line"
{
    Caption = 'HIS Revenue Line';
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
        field(2; "Document No."; Code[20])
        {
            Caption = 'Documment No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Item ID"; Code[20])
        {
            Caption = 'Item ID';
            DataClassification = ToBeClassified;
        }
        field(5; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Qty"; Decimal)
        {
            Caption = 'Qty';
            DataClassification = ToBeClassified;
        }
        field(7; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(9; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(10; "MOU Discount"; Decimal)
        {
            Caption = 'MOU Discount';
            DataClassification = ToBeClassified;
        }
        field(11; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
            DataClassification = ToBeClassified;
        }
        field(12; "Taxable Amount"; Decimal)
        {
            Caption = 'Taxable Amount';
            DataClassification = ToBeClassified;
        }
        field(13; "Patient Payable"; Decimal)
        {
            Caption = 'Patient Payable';
            DataClassification = ToBeClassified;
        }
        field(14; "Payor Payable"; Decimal)
        {
            Caption = 'Payor Payable';
            DataClassification = ToBeClassified;
        }
        field(15; "Account Type"; Enum "Purchase Line Type")
        {
            Caption = 'Account Type';
            DataClassification = ToBeClassified;
        }
        field(16; "Revenue Account"; Code[20])
        {
            Caption = 'Revenue Account';
            DataClassification = ToBeClassified;
        }
        field(17; "VAT Per"; Code[20])
        {
            Caption = 'VAT Per';
            DataClassification = ToBeClassified;
        }
        field(18; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(19; "Service Category"; Text[50])
        {
            Caption = 'Service Category';
            DataClassification = ToBeClassified;
        }
        field(20; "Package Patient"; Boolean)
        {
            Caption = 'Package Patient';
            DataClassification = ToBeClassified;
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
        }
        field(23; "Record Type"; Option)
        {
            Caption = 'Record Type';
            OptionMembers = ,Revenue,"Revenue Cancel";
            DataClassification = ToBeClassified;
        }
        field(24; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = ,Invoice,"Credit Memo";
            DataClassification = ToBeClassified;
        }
        field(25; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(26; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = ToBeClassified;
        }
        field(27; "Item Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Category Code';
            DataClassification = ToBeClassified;
        }
        field(28; "Service Item Code"; Code[20])
        {
            Caption = 'Service Item Code';
            DataClassification = ToBeClassified;
        }
        field(29; "Discount G/L Account"; Code[20])
        {
            Caption = 'Discount G/L Account';
            DataClassification = CustomerContent;
        }
        field(30; "MOU Discount G/L Account"; Code[20])
        {
            Caption = 'MOU Discount G/L Account';
            DataClassification = CustomerContent;
        }
        field(31; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
            DataClassification = CustomerContent;
        }
        field(32; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Account Type" = const(" ")) "Standard Text"
            ELSE
            IF ("Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Type" = CONST(Resource)) Resource
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("Charge (Item)")) "Item Charge"
            ELSE
            IF ("Account Type" = CONST(Item)) "item" WHERE(Blocked = CONST(false));
            ValidateTableRelation = false;
            trigger OnValidate()

            begin

                GetHISIntegrationSalesHdr();
                CASE "Account Type" OF
                    "Account Type"::" ":
                        BEGIN
                            StdTxt.GET("Account No.");
                            "Item Name" := StdTxt.Description;
                        END;
                END;
                IF HISIntegrationSalesHdr."Location Code" <> '' THEN BEGIN
                    "Location Code" := HISIntegrationSalesHdr."Location Code";
                    "Shortcut Dimension 1 Code" := HISIntegrationSalesHdr."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := HISIntegrationSalesHdr."Shortcut Dimension 2 Code";

                END;

            end;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Record Type", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure GetHISIntegrationSalesHdr()
    begin
        TestField("Record Type");
        TestField("Document Type");
        TestField("Document No.");
        IF ("Record Type" <> HISIntegrationSalesHdr."Record Type") OR ("Document Type" <> HISIntegrationSalesHdr."Document Type") OR
            ("Document No." <> HISIntegrationSalesHdr."Document No.") THEN BEGIN
            HISIntegrationSalesHdr.Reset();
            HISIntegrationSalesHdr.SetRange("Record Type", "Record Type");
            HISIntegrationSalesHdr.SetRange("Document Type", "Document Type");
            HISIntegrationSalesHdr.SetRange("Document No.", "Document No.");
            HISIntegrationSalesHdr.FindFirst();
        END;
    end;

    trigger OnInsert()
    BEGIN
        GetHISIntegrationSalesHdr();
    END;

    var
        HISIntegrationSalesHdr: Record "3E HIS Revenue Header";
        StdTxt: Record "Standard Text";
}
