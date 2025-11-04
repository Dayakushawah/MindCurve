tableextension 50012 "3E HIS Purch. Credit Memo" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50000; "3E Capex Type"; Enum "3E Capex Type")
        {
            Caption = 'Capex Type';
            DataClassification = CustomerContent;
        }
        field(50001; "3E Work Order Type"; Enum "3E Work Order Type")
        {
            Caption = 'Work Order Type';
            DataClassification = CustomerContent;
        }
        field(50002; "3E Item Type"; Enum "3E HIS Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
        }
        field(50003; "Store Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Name';
        }
    }
}
