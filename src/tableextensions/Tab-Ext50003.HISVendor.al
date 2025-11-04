tableextension 50003 "3E HIS Vendor Ext" extends Vendor
{
    fields
    {
        field(50000; "3E HIS Code"; Code[20])
        {
            Caption = 'HIS Code';
            DataClassification = CustomerContent;
        }
        field(50001; "3E Auto E-Mail"; Boolean)
        {
            Caption = 'Auto E-Mail';
            DataClassification = CustomerContent;
        }
    }
}
