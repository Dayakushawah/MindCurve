tableextension 50017 "3E Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50000; "BatchNo"; Code[20])
        {
            Caption = 'BatchNo';
            DataClassification = ToBeClassified;
        }
        field(50001; "ExpiryDate"; Date)
        {
            Caption = 'ExpiryDate';
            DataClassification = ToBeClassified;
        }
        field(50002; "Indent No"; Integer)
        {
            Caption = 'Indent No';
            DataClassification = ToBeClassified;
        }
        field(50003; "Station SI No"; Integer)
        {
            Caption = 'Station SI No';
            DataClassification = ToBeClassified;
        }
    }
}
