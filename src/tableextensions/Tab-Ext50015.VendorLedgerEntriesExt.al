tableextension 50015 "3E HIS Vendor Ledger Entry" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50000; "3E Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            DataClassification = CustomerContent;
        }

        field(50001; "3E Send E-Mail"; Boolean)
        {
            Caption = 'Send E-Mail';
            DataClassification = CustomerContent;
        }
        field(50002; "3E Select E-Mail"; Boolean)
        {
            Caption = 'Select E-Mail';
            DataClassification = CustomerContent;
        }
        field(50003; "3E Vendor Email"; text[250])
        {
            Caption = 'Vendor Email';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."E-Mail" where("No." = field("Vendor No.")));
        }
    }
}
