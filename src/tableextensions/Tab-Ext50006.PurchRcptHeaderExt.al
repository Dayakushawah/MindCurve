tableextension 50006 "3E HIS Purch. Rcpt. Header" extends "Purch. Rcpt. Header"
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
        field(50003; "3E Delivery Terms"; Text[150])
        {
            Caption = 'Delivery Terms';
            DataClassification = CustomerContent;
        }
        field(50004; "Store Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Store Name';
        }
        field(50005; "Indent Amount"; Decimal)
        {
            Caption = 'Indent Amount';
            DataClassification = ToBeClassified;
        }
        field(50006; "Station Name"; Text[60])
        {
            Caption = 'Station Name';
            DataClassification = ToBeClassified;
        }
        field(50007; "Integration PO Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Indent Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Order Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
}
