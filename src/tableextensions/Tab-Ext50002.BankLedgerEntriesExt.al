tableextension 50002 "3E HIS Bank Ledger Entry" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "3E UTR No."; Code[35])
        {
            Caption = 'UTR No.';
            DataClassification = CustomerContent;
        }
        field(50001; "3E Narration"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Narration';
        }
    }
}
