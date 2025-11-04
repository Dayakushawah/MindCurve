page 50018 "3E HIS Employee Staging List"
{
    PageType = List;
    Editable = false;
    CardPageId = "3E HIS Employee Staging Card";
    SourceTableView = SORTING("Entry No.") WHERE(IsCreated = FILTER(false), "Party Type" = FILTER(Employee));
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "3E HIS Master Staging";
    Caption = 'HIS Employee Staging List';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("Party Type"; Rec."Party Type")
                {
                    ApplicationArea = All;
                }
                field("HIS Code"; Rec."HIS Code")
                {
                    ApplicationArea = all;
                    Caption = 'Employee ID';
                }
                // field("Employee Code"; Rec."Vendor/Customer Code")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Employee Name';
                // }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name 2';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = aLL;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
                field(IsCreated; Rec.IsCreated)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the IsCreated field.';
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}