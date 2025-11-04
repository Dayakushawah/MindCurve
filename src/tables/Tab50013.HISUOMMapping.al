table 50013 "3E HIS UOM Mapping"
{
    Caption = 'HIS UOM Mapping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "HIS UOM"; Text[20])
        {
            Caption = 'HIS UOM';
            DataClassification = CustomerContent;
        }
        field(2; "HIS UOM Name"; Text[50])
        {
            Caption = 'HIS UOM Name';
            DataClassification = CustomerContent;
        }
        field(3; "UOM Code"; Code[20])
        {
            Caption = 'UOM Code';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
    }
    keys
    {
        key(PK; "HIS UOM")
        {
            Clustered = true;
        }
    }
}
