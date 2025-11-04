tableextension 50004 "3E HIS Customer Ext" extends Customer
{
    fields
    {
        field(50000; "3E HIS Code"; Code[20])
        {
            Caption = 'HIS Code';
            DataClassification = CustomerContent;
        }

    }
}
