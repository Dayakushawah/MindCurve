tableextension 50011 "3E HIS Purch. Inv. Line" extends "Purch. Inv. Line"
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
        field(50005; "3E HIS Item Type"; Enum "3E HIS Item Type")
        {
            Caption = '3E HIS Item Type';
            DataClassification = CustomerContent;
        }

    }
}
