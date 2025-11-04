table 50006 "3E HIS Purchase Line"
{
    Caption = 'HIS Purchase Line';
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
        field(2; "Document No."; Code[20])
        {
            Caption = 'Documment No.';
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(4; "Item ID"; Code[20])
        {
            Caption = 'Item ID';
            DataClassification = CustomerContent;
        }
        field(5; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
            DataClassification = CustomerContent;
        }
        field(6; "Received Qty"; Decimal)
        {
            Caption = 'Received Qty';
            DataClassification = CustomerContent;
        }
        field(7; "Free Qty"; Decimal)
        {
            Caption = 'Free Qty';
            DataClassification = CustomerContent;
        }
        field(8; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(10; "Service Code"; Text[10])
        {
            Caption = 'Service Code';
            DataClassification = CustomerContent;
        }
        field(11; "Gross Amount"; Decimal)
        {
            Caption = 'Gross Amount';
            DataClassification = CustomerContent;
        }
        field(12; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
        }
        field(13; "Other Charges"; Decimal)
        {
            Caption = 'Other Charges';
            DataClassification = CustomerContent;
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = IF ("Item Type" = const(" ")) "Standard Text"
            ELSE
            IF ("Item Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Item Type" = CONST(Resource)) Resource
            ELSE
            IF ("Item Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Item Type" = CONST("Charge (Item)")) "Item Charge"
            ELSE
            IF ("Item Type" = CONST(Item)) "item" WHERE(Blocked = CONST(false));
            ValidateTableRelation = false;
            trigger OnValidate()

            begin

                GetHISIntegrationPurchaseSalesHdr();
                CASE "ITEM Type" OF
                    "ITEM Type"::" ":
                        BEGIN
                            StdTxt.GET("Item No.");
                            "Item Name" := StdTxt.Description;
                        END;
                end;
                IF HISIntegrationPurchaseSalesHdr."Location Code" <> '' THEN BEGIN
                    "Location Code" := HISIntegrationPurchaseSalesHdr."Location Code";
                    "Shortcut Dimension 1 Code" := HISIntegrationPurchaseSalesHdr."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := HISIntegrationPurchaseSalesHdr."Shortcut Dimension 2 Code";
                end;
            End;
        }
        field(15; "Purchase Account"; Code[20])
        {
            Caption = 'Purchase Account';
            DataClassification = CustomerContent;
        }
        field(16; "VAT Per"; Code[10])
        {
            Caption = 'VAT Per';
            DataClassification = CustomerContent;
        }
        field(17; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
        }
        field(19; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(20; "Record Type"; Option)
        {
            Caption = 'Record Type';
            OptionMembers = ,GRN,"GRN Return",Sales,"Sales Return";
            DataClassification = CustomerContent;
        }
        field(21; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = ,Order,"Return Order";
            DataClassification = CustomerContent;
        }
        field(22; "Fixed Assets No."; Code[20])
        {
            Caption = 'Fixed Assets No.';
            DataClassification = CustomerContent;
        }
        field(23; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(24; "Item Category Code"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Category Code';
        }
        field(25; "Item Sub Category"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Sub Category';
        }
        field(26; "Discount %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Discount %';
        }
        field(27; "Batch No"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Batch No';
        }
        field(28; "Expiry Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Expiry Date';
        }
        field(29; "Unit of Measurement"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit of Measurement';
        }
        field(30; "Pack Size"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Pack Size';
        }
        field(31; "Item Category Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Category Name';
        }
        field(32; "Item Type"; Enum "Purchase Line Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        field(33; "HIS Item Type"; Enum "3E HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        field(34; "Item Type Code"; Code[10])
        {
            Caption = 'Item Type Code';
            DataClassification = CustomerContent;
        }
        field(35; "Item Type Name"; Text[100])
        {
            Caption = 'Item Type Name';
            DataClassification = CustomerContent;
        }
        field(36; "Item Sub Type Code"; Code[10])
        {
            Caption = 'Item Sub Type Code';
            DataClassification = CustomerContent;
        }
        field(37; "Item Sub Type Name"; Text[100])
        {
            Caption = 'Item Sub Type Name';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Entry No.", "Record Type", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure GetHISIntegrationPurchaseSalesHdr()
    begin
        TestField("Record Type");
        TestField("Document Type");
        TestField("Document No.");
        IF ("Record Type" <> HISIntegrationPurchaseSalesHdr."Record Type") OR ("Document Type" <> HISIntegrationPurchaseSalesHdr."Document Type") OR
            ("Document No." <> HISIntegrationPurchaseSalesHdr."Document No.") THEN BEGIN
            HISIntegrationPurchaseSalesHdr.Reset();
            HISIntegrationPurchaseSalesHdr.SetRange("Record Type", "Record Type");
            HISIntegrationPurchaseSalesHdr.SetRange("Document Type", "Document Type");
            HISIntegrationPurchaseSalesHdr.SetRange("Document No.", "Document No.");
            HISIntegrationPurchaseSalesHdr.FindFirst();

        END;
    end;

    trigger OnInsert()
    BEGIN
        GetHISIntegrationPurchaseSalesHdr();
    END;

    var
        HISIntegrationPurchaseSalesHdr: Record "3E HIS Purchase Header";
        StdTxt: Record "Standard Text";
}
