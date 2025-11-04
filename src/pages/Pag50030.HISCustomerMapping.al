page 50030 "3E HIS Customer Mapping"
{
    ApplicationArea = All;
    Caption = 'HIS Customer Mapping';
    PageType = List;
    SourceTable = "3E HIS Customer Mapping";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("HIS Code"; Rec."HIS Code")
                {
                    ToolTip = 'Specifies the value of the HIS Code field.';
                }
                field("HIS Customer Name"; Rec."HIS Customer Name")
                {
                    ToolTip = 'Specifies the value of the HIS Customer Name field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    ToolTip = 'Specifies the value of the Unit Code field.';
                }
            }
        }
    }
}
