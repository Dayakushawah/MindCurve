tableextension 50016 "3E HIS Purcha Line" extends "Purchase Line"
{
    fields
    {
        field(50000; "3E Item Type"; Enum "3E HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        field(50001; "BatchNo"; Code[20])
        {
            Caption = 'BatchNo';
            DataClassification = ToBeClassified;
        }
        field(50002; "ExpiryDate"; Date)
        {
            Caption = 'ExpiryDate';
            DataClassification = ToBeClassified;
        }
        field(50003; "Indent No"; Integer)
        {
            Caption = 'Indent No';
            DataClassification = ToBeClassified;
        }
        field(50004; "Station SI No"; Integer)
        {
            Caption = 'Station SI No';
            DataClassification = ToBeClassified;
        }
    }
}
