table 50000 "3E HIS Master Staging"
{
    Caption = 'HIS Master Staging ';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            BlankZero = true;
            MinValue = 1;
            DataClassification = CustomerContent;
        }
        field(2; "Party Type"; Option)
        {
            Caption = 'Party Type';
            OptionMembers = ,Vendor,Customer,Employee,Item,Doctor;
            DataClassification = CustomerContent;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(4; "Search Name"; Text[100])
        {
            Caption = 'Search Name';
            DataClassification = CustomerContent;
        }
        field(5; "Name 2"; Text[100])
        {
            Caption = 'Name 2';
            DataClassification = CustomerContent;
        }
        field(6; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(7; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }
        field(8; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(9; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(10; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(11; County; Text[30])
        {
            Caption = 'County';
            CaptionClass = '5,1,' + "Country/Region Code";
            DataClassification = CustomerContent;
        }
        field(12; Contact; Text[50])
        {
            Caption = 'Contact';
            DataClassification = CustomerContent;
        }
        field(13; "Phone No."; Text[11])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }
        field(14; "Vendor/Customer Code"; Code[20])
        {
            Caption = 'Vendor/Customer Code';
            TableRelation = IF ("Party Type" = const(Vendor)) "Vendor"
            else
            if ("Party Type" = const(Customer)) "Customer";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Name := '';
                IF "party Type" = "party Type"::Vendor then begin
                    Vendor.Get("Vendor/Customer Code");
                    Name := Vendor.Name;
                    "Name 2" := Vendor."Name 2";
                end;
                IF "party Type" = "party Type"::Customer then begin
                    Customer.Get("Vendor/Customer Code");
                    Name := Customer.Name;
                    "Name 2" := Customer."Name 2";
                end;
                IF "party Type" = "party Type"::Employee then begin
                    Employee.Get("Vendor/Customer Code");
                    Name := Employee."First Name";
                    "Name 2" := Employee."Last Name";
                end;

            end;
        }
        field(15; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(16; "Vendor Posting Group"; Code[20])
        {
            Caption = 'Vendor Posting Group';
            TableRelation = "Vendor Posting Group";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(17; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(19; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionMembers = ,"G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
            DataClassification = CustomerContent;
        }
        field(20; "Payment Type"; Code[30])
        {
            Caption = 'Payment Type';
            DataClassification = CustomerContent;
        }
        field(21; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(22; "Application Method"; Enum "Application Method")
        {
            Caption = 'Application Method';
            DataClassification = CustomerContent;
        }
        field(23; "VAT Registration No."; Code[15])
        {
            Caption = 'VAT Registration No.';
            DataClassification = CustomerContent;
        }
        field(24; "Error Description"; Text[250])
        {
            Caption = 'Error Description';
            DataClassification = CustomerContent;
        }
        field(25; IsCreated; Boolean)
        {
            Caption = 'IsCreated';
            DataClassification = CustomerContent;
        }
        field(26; "HIS Code"; Code[20])
        {
            Caption = 'HIS Code';
            DataClassification = CustomerContent;
        }
        field(27; "HIS Interface By"; Code[50])
        {
            Caption = 'HIS Interface By';
            DataClassification = CustomerContent;
        }
        field(28; "HIS Interface Date Time"; DateTime)
        {
            Caption = 'HIS Interface Date Time';
            DataClassification = CustomerContent;
        }
        field(29; "Modified by"; Code[50])
        {
            Caption = 'Modified by';
            DataClassification = CustomerContent;
        }
        field(30; "Modified Date Time"; DateTime)
        {
            Caption = 'Modified Date Time';
            DataClassification = CustomerContent;
        }

        field(31; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            ValidateTableRelation = false;
        }
        field(32; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
            ValidateTableRelation = false;
        }
        field(33; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
            ValidateTableRelation = false;
        }
        field(34; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Inventory Posting Group";
            ValidateTableRelation = false;
        }
        field(35; "Base Unit of Measure"; Code[20])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
            ValidateTableRelation = false;
        }
        field(36; "VAT Per"; code[10])
        {
            Caption = 'VAT Per';
        }
        field(37; "Service Code"; code[10])
        {
            Caption = 'Service Code';
        }
        field(38; "Employee Posting Group"; Code[20])
        {
            Caption = 'Employee Posting Group';
            TableRelation = "Employee Posting Group";
            ValidateTableRelation = false;
        }
        field(39; "Bank Account Name"; Code[100])
        {
            Caption = 'Bank Account Name';
        }
        field(40; "Bank Branch No."; Text[20])
        {
            Caption = 'Bank Branch No.';
        }
        field(41; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
        }
        field(42; "Bank Address"; Text[100])
        {
            Caption = 'Bank Address';
        }
        field(43; "Bank Address 2"; Text[50])
        {
            Caption = 'Bank Address 2';
        }
        field(44; "VC Bank Account Name"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(45; "Bank City"; Text[30])
        {
            Caption = 'Bank City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));

            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(46; "Bank Post Code"; Code[20])
        {
            Caption = 'Bank Post Code';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(47; "IFSC Code"; Text[20])
        {
            Caption = 'IFSC Code';
        }
        field(48; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                ValidateEmail();
            end;
        }
        field(49; "Sponser code"; Code[30])
        {
            Caption = 'Sponser code';
        }
        field(50; "Sponser Name"; Text[100])
        {
            Caption = 'Sponser Name';
        }
        field(51; "Item ID"; Code[20])
        {
            Caption = 'Item ID';
            DataClassification = CustomerContent;
        }
        field(52; "Item Category Name"; text[50])
        {
            Caption = 'Item Category Name';
            DataClassification = CustomerContent;
        }
        field(53; "Item Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Category Code';
            DataClassification = ToBeClassified;
        }
        field(54; "Item Sub Category Name"; Text[50])
        {
            Caption = 'Item Sub Category Name';
            DataClassification = ToBeClassified;
        }
        field(55; "Pack Size"; Text[10])
        {
            Caption = 'Pack Size';
            DataClassification = ToBeClassified;
        }
        field(56; "Inventory-NonInventory"; Enum "Item Type")
        {
            Caption = 'Inventory-NonInventory Item';

        }
        field(57; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
            DataClassification = CustomerContent;
        }
        field(58; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;
        }
        field(59; "Date of Joining"; Date)
        {
            Caption = 'Date of Joining';
            DataClassification = CustomerContent;
        }
        field(60; "Date of Leaving"; Date)
        {
            Caption = 'Date of Leaving';
            DataClassification = CustomerContent;
        }
        field(61; Designation; Text[100])
        {
            Caption = 'Designation';
            DataClassification = CustomerContent;
        }
        field(62; Grade; Text[100])
        {
            Caption = 'Grade';
            DataClassification = CustomerContent;
        }
        field(63; Title; Text[20])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(64; "Sub Department Name"; Text[100])
        {
            Caption = 'Sub Department Name';
            DataClassification = CustomerContent;
        }
        field(65; Speciality; Text[100])
        {
            Caption = 'Speciality';
            DataClassification = CustomerContent;
        }
        field(66; "Employment Type"; Text[100])
        {
            Caption = 'Employment Type';
            DataClassification = CustomerContent;
        }
        field(67; Aadhar; Code[12])
        {
            Caption = 'Aadhar';
            DataClassification = CustomerContent;
        }
        field(68; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = ,Active,Inactive,Terminated;
            DataClassification = CustomerContent;
        }
        field(69; "Valid From"; Date)
        {
            Caption = 'Valid From';
            DataClassification = CustomerContent;
        }
        field(70; "Valid To"; Date)
        {
            Caption = 'Valid To';
            DataClassification = CustomerContent;
        }
        field(71; "Mobile No."; Text[10])
        {
            Caption = 'Mobile No.';
            DataClassification = CustomerContent;
        }
        field(72; Qualification; Text[50])
        {
            Caption = 'Qualification';
            DataClassification = CustomerContent;
        }
        field(73; "Registration No."; Text[50])
        {
            Caption = 'Registration No.';
            DataClassification = CustomerContent;
        }
        field(74; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
            DataClassification = CustomerContent;
        }
        field(75; "Unit Name"; Text[100])
        {
            Caption = 'Unit Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name WHERE("Global Dimension No." = CONST(1),
            Code = field("Global Dimension 1 Code")));
        }
        field(76; Experience; Text[50])
        {
            Caption = 'Experience';
            DataClassification = CustomerContent;
        }
        field(77; "Engagement Mode"; Text[50])
        {
            Caption = 'Engagement Mode';
            DataClassification = CustomerContent;
        }
        field(78; "Payment Mode"; Text[50])
        {
            Caption = 'Payment Mode';
            DataClassification = CustomerContent;
        }
        field(79; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = CustomerContent;
        }
        field(80; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Key1; "HIS Code")
        {
        }
    }
    var
        PostCode: Record "Post Code";

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupCity(var Vendor: Record Vendor; var PostCodeRec: Record "Post Code")
    begin
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupPostCode(var Vendor: Record Vendor; var PostCodeRec: Record "Post Code")
    begin
    end;

    local procedure ValidateEmail()
    var
        MailManagement: Codeunit "Mail Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeValidateEmail(Rec, IsHandled, xRec);
        if IsHandled then
            exit;

        if "E-Mail" = '' then
            exit;
        MailManagement.CheckValidEmailAddresses("E-Mail");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateEmail(var HISMasterStaging: Record "3E HIS Master Staging"; var IsHandled: Boolean; xHISMasterStaging: Record "3E HIS Master Staging")
    begin
    end;

    var
        Vendor: Record Vendor;
        Customer: Record Customer;
        Employee: Record Employee;

}
