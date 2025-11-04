table 50010 "3E HIS Item Mapping"
{
    Caption = 'HIS Item Mapping';
    DataClassification = CustomerContent;
    //LookupPageId = "3E HIS Item Mapping";
    //DrillDownPageId = "3E HIS Item Mapping";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Entry Type"; Enum "3E HIS Item Map. Entry Type")
        {
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                IF GLAccount.GET("G/L Account No.") THEN
                    "G/L Account Name" := GLAccount.Name
                ELSE
                    "G/L Account Name" := '';
            end;
        }
        field(4; "G/L Account Name"; Text[100])
        {
            Caption = 'G/L Account Name';
            DataClassification = CustomerContent;
        }
        field(5; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(6; "Product Group Code"; Code[20])
        {
            Caption = 'Product Group Code';
            DataClassification = CustomerContent;
        }

        field(8; "Item Category Description"; Code[100])
        {
            Caption = 'Item Category Description';
            DataClassification = CustomerContent;
        }
        field(9; "Product Group Description"; Code[50])
        {
            Caption = 'Product Group Description';
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
