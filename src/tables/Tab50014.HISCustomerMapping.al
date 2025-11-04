table 50014 "3E HIS Customer Mapping"
{
    Caption = 'HIS Customer Mapping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "HIS Code"; Code[20])
        {
            Caption = 'HIS Code';
        }
        field(2; "HIS Customer Name"; Text[100])
        {
            Caption = 'HIS Customer Name';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;

            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                if "Customer No." <> '' then begin
                    Cust.get("Customer No.");
                    "Customer Name" := Cust.Name;
                end;
            end;
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(5; "Unit Code"; Code[20])
        {
            Caption = 'Unit Code';
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
    }
    keys
    {
        key(PK; "HIS Code")
        {
            Clustered = true;
        }
    }
}
