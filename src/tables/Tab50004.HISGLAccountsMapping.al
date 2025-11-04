table 50004 "3E HIS GL Accounts Mapping"
{
    Caption = 'HIS GL Accounts Mapping';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            BlankZero = true;
            MinValue = 1;

            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; Type; enum "3E HIS G/L Account Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(3; "Service/Station Head"; Code[30])
        {
            Caption = 'Service/Station Head';
            DataClassification = CustomerContent;
        }
        field(4; "Service/Station Head Name"; Text[100])
        {
            Caption = 'Service/Station Head Name';
            DataClassification = CustomerContent;
        }
        field(5; "Category Code"; Text[30])
        {
            Caption = 'Category Code';
            DataClassification = CustomerContent;
        }
        field(6; "Sub Category Code"; Text[30])
        {
            Caption = 'Sub Category Code';
            DataClassification = CustomerContent;
        }
        field(7; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(8; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                BankAccount: Record "Bank Account";
            begin
                IF "Account Type" = "Account Type"::"G/L Account" then begin
                    IF GLAccount.Get("Account No.") then
                        "Account Name" := GLAccount.Name;
                end ELSE
                    if "Account Type" = "Account Type"::"Bank Account" then begin
                        IF BankAccount.Get("Account No.") then
                            "Account Name" := BankAccount.Name;
                    end ELSE
                        "Account Name" := '';

            end;
        }
        field(9; "Account Name"; Text[100])
        {
            Caption = 'Account Name';
            DataClassification = CustomerContent;
        }
        field(10; "Department Code"; Text[30])
        {
            Caption = 'Dimension Value Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = field("Dimension Code"));
        }

        field(11; "Sub-Department Code"; Text[30])
        {
            Caption = 'Sub-Department Code';
            DataClassification = CustomerContent;
        }

        field(12; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
            DataClassification = CustomerContent;
        }
        field(13; "Sub-Department Name"; Text[100])
        {
            Caption = 'Sub-Department Name';
            DataClassification = CustomerContent;
        }
        field(15; "Category Name"; Text[100])
        {
            Caption = 'Category Name';
            DataClassification = CustomerContent;
        }
        field(16; "Sub Category Name"; Text[100])
        {
            Caption = 'Sub Category Name';
            DataClassification = CustomerContent;
        }
        field(26; "MOP Code"; Text[30])
        {
            Caption = 'MOP Code';
            DataClassification = CustomerContent;
        }
        field(27; "Other MOP Code"; Text[30])
        {
            Caption = 'Other MOP Code';
            DataClassification = CustomerContent;
        }
        field(28; "OPIP"; Text[10])
        {
            Caption = 'OPIP';
            DataClassification = CustomerContent;
        }
        field(29; "HIS Code"; Text[20])
        {
            Caption = 'HIS Code';
            DataClassification = CustomerContent;
        }
        field(30; "HIS Name"; Text[50])
        {
            Caption = 'HIS Name';
            DataClassification = CustomerContent;
        }
        field(31; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
        field(32; "Dimension Value Name"; Text[50])
        {
            Caption = 'Dimension Value Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name WHERE("Dimension Code" = FIELD("Dimension Code"),
                                                           Code = FIELD("Department Code")));
        }
        field(35; "Discount G/L Account"; Code[20])
        {
            Caption = 'Discount G/L Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account" where(Blocked = filter(false), "Direct Posting" = filter(true));
        }
        field(36; "Discount G/L Account Name"; Text[100])
        {
            Caption = 'Discount G/L Account Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("Discount G/L Account")));
        }
        field(37; Package; Boolean)
        {
            Caption = 'Package';
        }
        field(38; "MOU Discount G/L Account"; Code[20])
        {
            Caption = 'Discount G/L Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account" where(Blocked = filter(false), "Direct Posting" = filter(true));
        }
        field(39; "MOU Discount G/L Account Name"; Text[100])
        {
            Caption = 'Discount G/L Account Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("MOU Discount G/L Account")));
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
