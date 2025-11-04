table 50001 "3E HIS Integartion Setup"
{
    Caption = 'HIS Integartion Setup';
    DrillDownPageID = "3E Integration Setup";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Integration Enabled"; Boolean)
        {
            Caption = 'Integration Enabled';
            DataClassification = CustomerContent;
        }
        field(3; "Vendor Creation Enabled"; Boolean)
        {
            Caption = 'Vendor Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(4; "Customer Creation Enabled"; Boolean)
        {
            Caption = 'Customer Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(5; "Vendor Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Vendor Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            ValidateTableRelation = true;
            DataClassification = CustomerContent;
        }
        field(6; "Custom Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Custom Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            ValidateTableRelation = true;
            DataClassification = CustomerContent;
        }
        field(7; "Revenue Creation Enabled"; Boolean)
        {
            Caption = 'Revenue Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(8; "Consumption Creation Enabled"; Boolean)
        {
            Caption = 'Consumption Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(9; "Adjustment Creation Enables"; Boolean)
        {
            Caption = 'Adjustment Creation Enables';
            DataClassification = CustomerContent;
        }
        field(10; "GRN Creation Enabled"; Boolean)
        {
            Caption = 'GRN Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(11; "GRN Item Wise/ Account Wise"; Option)
        {
            Caption = 'GRN Item Wise/ Account Wise';
            OptionMembers = ,Purchase,Item,"G/L Account";
            DataClassification = CustomerContent;
        }
        field(12; "GRN Return Creation Enabled"; Boolean)
        {
            Caption = 'GRN Return Creation Enabled';
            DataClassification = CustomerContent;

        }
        field(13; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
        }
        field(14; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = CustomerContent;
        }
        field(15; "Item Creation Enabled"; Boolean)
        {
            Caption = 'Item Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(16; "Employee Creation Enabled"; Boolean)
        {
            Caption = 'Employee Creation Enabled';
            DataClassification = CustomerContent;
        }
        field(17; "Job Qu. Purchase Enabled"; Boolean)
        {
            Caption = 'Job Queue Purchase Enabled';
            DataClassification = CustomerContent;
        }
        field(18; "Job Qu. Purch. Ret Cr. Enabled"; Boolean)
        {
            Caption = 'Job Queue Purchase Return Enabled';
            DataClassification = CustomerContent;
        }
        field(20; "GRN/GRN Return Handling"; Option)
        {
            Caption = 'GRN/GRN Return Handling';
            OptionMembers = " ","Via Orders","Via Invoices";
            OptionCaption = ' ,Via Orders,Via Invoices';
            InitValue = "Via Orders";
            DataClassification = CustomerContent;
        }
        field(21; "Revenue/Rev. Cancel Handling"; Option)
        {
            Caption = 'Revenue/Rev. Cancel Handling';
            OptionMembers = " ","Via Journals","Via Invoices";
            OptionCaption = ' ,Via Journals,Via Invoices';
            InitValue = "Via Invoices";
            DataClassification = CustomerContent;
        }
        field(23; "Rev./Rev.Cancel Direct Post"; Boolean)
        {
            Caption = 'Revenue/Rev. Cancel Direct Post';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec."Rev./Rev.Cancel Direct Post" then
                    Rec.TestField("Revenue/Rev. Cancel Handling", Rec."Revenue/Rev. Cancel Handling"::"Via Journals");
            end;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
