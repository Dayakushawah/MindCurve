table 50018 "3E HIS Indent Line"
{
    Caption = 'HIS Indent Line';
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
        field(6; "Received Qty"; Decimal)
        {
            Caption = 'Received Qty';
            DataClassification = ToBeClassified;
        }
        field(7; "Free Qty"; Decimal)
        {
            Caption = 'Free Qty';
            DataClassification = ToBeClassified;
        }
        field(8; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(10; "Service Code"; Code[20])
        {
            Caption = 'Service Code';
            DataClassification = ToBeClassified;
        }
        field(11; "Gross Amount"; Decimal)
        {
            Caption = 'Gross Amount';
            DataClassification = ToBeClassified;
        }
        field(12; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(13; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
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
                END;
                IF HISIntegrationPurchaseSalesHdr."Location Code" <> '' THEN BEGIN
                    "Location Code" := HISIntegrationPurchaseSalesHdr."Location Code";
                    "Shortcut Dimension 1 Code" := HISIntegrationPurchaseSalesHdr."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := HISIntegrationPurchaseSalesHdr."Shortcut Dimension 2 Code";

                END;

            end;

        }
        field(14; "Item Type"; Enum "Purchase Line Type")
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
        }
        field(15; "Purchase Account"; Code[20])
        {
            Caption = 'Purchase Account';
            DataClassification = ToBeClassified;
        }
        field(16; "VAT Per"; Code[10])
        {
            Caption = 'VAT Per';
            DataClassification = ToBeClassified;
        }
        field(17; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
        }
        field(19; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
        }
        field(20; "Record Type"; Option)
        {
            Caption = 'Record Type';
            OptionMembers = ,Purchase,"Purchase Return",Sales,"Sales Return";
            DataClassification = ToBeClassified;
        }
        field(21; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = ,Invoice,"Credit Memo";
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = ToBeClassified;
        }
        field(23; "BatchNo"; Code[20])
        {
            Caption = 'BatchNo';
            DataClassification = ToBeClassified;
        }
        field(24; "ExpiryDate"; Date)
        {
            Caption = 'ExpiryDate';
            DataClassification = ToBeClassified;
        }
        field(25; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            DataClassification = ToBeClassified;
        }
        field(26; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            DataClassification = ToBeClassified;
        }
        field(27; "Indent No"; Integer)
        {
            Caption = 'Indent No';
            DataClassification = ToBeClassified;
        }
        field(28; "Station SI No"; Integer)
        {
            Caption = 'Station SI No';
            DataClassification = ToBeClassified;
        }
        field(29; "Item Category Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Category Name';
        }
        field(30; "Item Sub category Id"; Code[10])
        {
            Caption = 'Item Sub category Id';
            DataClassification = CustomerContent;
        }
        field(31; "Item Sub category Name"; Text[100])
        {
            Caption = 'Item Sub category Name';
            DataClassification = CustomerContent;
        }
        field(32; "Item Type Code"; Code[10])
        {
            Caption = 'Item Type Code';
            DataClassification = CustomerContent;
        }
        field(33; "Item Type Name"; Text[100])
        {
            Caption = 'Item Type Name';
            DataClassification = CustomerContent;
        }
        field(34; "Item Sub Type Code"; Code[10])
        {
            Caption = 'Item Sub Type Code';
            DataClassification = CustomerContent;
        }
        field(35; "Item Sub Type Name"; Text[100])
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
        HISIntegrationPurchaseSalesHdr: Record "3E HIS Indent Header";
        GLAcc: Record "G/L Account";
        Item: Record "Item";
        Res: Record "Resource";
        StdTxt: Record "Standard Text";
        FA: Record "Fixed Asset";
        ItemCharge: Record "Item Charge";
}
