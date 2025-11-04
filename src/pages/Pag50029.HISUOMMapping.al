page 50029 "3E HIS UOM Mapping"
{
    ApplicationArea = All;
    Caption = 'HIS UOM Mapping';
    PageType = List;
    SourceTable = "3E HIS UOM Mapping";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("HIS UOM"; Rec."HIS UOM")
                {
                    ToolTip = 'Specifies the value of the HIS UOM field.';
                    Caption = 'HIS UOM';
                }
                field("HIS UOM Name"; Rec."HIS UOM Name")
                {
                    ToolTip = 'Specifies the value of the HIS UOM Name field.';
                    Caption = 'HIS UOM Name';
                }
                field("UOM Code"; Rec."UOM Code")
                {
                    ToolTip = 'Specifies the value of the UOM Code field.';
                    Caption = 'UOM Code';
                }
            }
        }
    }
}
