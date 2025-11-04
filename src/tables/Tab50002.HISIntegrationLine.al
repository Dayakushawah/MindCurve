table 50002 "3E HIS Integration Setup Line"
{
    Caption = 'HIS Integration Setup Line';
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
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                DimensionValue.Reset();
                DimensionValue.SetRange("Global Dimension No.", 1);
                DimensionValue.SetRange(Code, "Global Dimension 1 Code");
                if DimensionValue.FindFirst() then begin
                    Description := DimensionValue.Name;
                end

            end;
        }
        field(3; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Revenue,GRN,Consumption,Payroll,Collection;
            DataClassification = CustomerContent;
        }
        field(6; "General Journal Template Code"; Code[20])
        {
            Caption = 'General Journal Template Code';
            TableRelation = "Gen. Journal Template";
            DataClassification = CustomerContent;
        }
        field(7; "General Journal Batch Code"; Code[20])
        {
            Caption = 'General Journal Batch Code';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("General Journal Template Code"));
            DataClassification = CustomerContent;
        }
        field(8; Location; Code[20])
        {
            Caption = 'Location';
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    var
        DimensionValue: Record "Dimension Value";

}
