table 50007 "3E HIS E-Mail Setup"
{
    Caption = 'E-Mail Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(Report));
            DataClassification = CustomerContent;
        }

        field(3; "CC E-Mail ID"; Text[200])
        {
            Caption = 'CC E-Mail ID';
            DataClassification = CustomerContent;
        }
        field(4; "E-Mail Body"; Text[1000])
        {
            Caption = 'E-Mail Body';
            DataClassification = CustomerContent;
        }
        field(5; "Folder Path"; Text[100])
        {
            Caption = 'Folder Path';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
