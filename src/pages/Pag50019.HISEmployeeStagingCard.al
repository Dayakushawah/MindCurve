page 50019 "3E HIS Employee Staging Card"
{

    Caption = 'HIS Employee Staging Card';
    PageType = Card;
    SourceTable = "3E HIS Master Staging";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Party Type"; Rec."Party Type")
                {
                    ToolTip = 'Specifies the value of the Party Type field';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee Code"; Rec."HIS Code")
                {
                    ToolTip = 'Specifies the value of the HIS Code field';
                    ApplicationArea = All;
                    Caption = 'Employee ID';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the HIS Code field';
                    ApplicationArea = All;
                    Caption = 'Title';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                    Caption = 'Employee Name';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ToolTip = 'Specifies the value of the Name 2 field';
                    ApplicationArea = All;
                    Caption = 'Employee Name 2';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field';
                    ApplicationArea = All;
                    Caption = 'Gender';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ToolTip = 'Specifies the value of the Birth Date field';
                    ApplicationArea = All;
                    Caption = 'DOB';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field';
                    ApplicationArea = All;
                    Caption = 'Date of Joining';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ToolTip = 'Specifies the value of the Date of Leaving field';
                    ApplicationArea = All;
                    Caption = 'Date of Leaving';
                }
                field(Designation; Rec.Designation)
                {
                    ToolTip = 'Specifies the value of the Designation field';
                    ApplicationArea = All;
                    Caption = 'Designation';
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field';
                    ApplicationArea = All;
                    Caption = 'Employee Grade';
                }
                field(Aadhar; Rec.Aadhar)
                {
                    ToolTip = 'Specifies the value of the Aadhar field';
                    ApplicationArea = All;
                    Caption = 'Aadhar';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field("Valid From"; Rec."Valid From")
                {
                    ToolTip = 'Specifies the value of the Valid From field';
                    ApplicationArea = All;
                    Caption = 'Valid From';
                }
                field("Valid To"; Rec."Valid To")
                {
                    ToolTip = 'Specifies the value of the Valid To field';
                    ApplicationArea = All;
                    Caption = 'Valid To';
                }
                field(Qualification; Rec.Qualification)
                {
                    ToolTip = 'Specifies the value of the Qualification field';
                    ApplicationArea = All;
                    Caption = 'Qualification';
                }
                field(Experience; Rec.Experience)
                {
                    ToolTip = 'Specifies the value of the Experience field';
                    ApplicationArea = All;
                    Caption = 'Experience';
                }
                field("Engagement Mode"; Rec."Engagement Mode")
                {
                    ToolTip = 'Specifies the value of the Engagement Mode field';
                    ApplicationArea = All;
                    Caption = 'Engagement Mode';
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ToolTip = 'Specifies the value of the Payment Mode field';
                    ApplicationArea = All;
                    Caption = 'Payment Mode';
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Error Description field';
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
            group("Address Information")
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = ALL;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ToolTip = 'Specifies the value of the Mobile No. field';
                    ApplicationArea = All;
                    Caption = 'Mobile No.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field';
                    ApplicationArea = All;
                    Caption = 'E-Mail';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = all;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = ALL;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ToolTip = 'Specifies the value of the Unit Name field';
                    ApplicationArea = All;
                    Caption = 'Unit Name';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field';
                    ApplicationArea = All;
                    Caption = 'Department Name';
                }
                field("Sub Department Name"; Rec."Sub Department Name")
                {
                    ToolTip = 'Specifies the value of the Sub Department Name field';
                    ApplicationArea = All;
                    Caption = 'Sub Department Name';
                }
                field(Speciality; Rec.Speciality)
                {
                    ToolTip = 'Specifies the value of the Speciality field';
                    ApplicationArea = All;
                    Caption = 'Speciality';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = all;
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = All;
                }

            }
            group("Bank Details")
            {
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = all;
                }
                field("Employee Bank Account Name"; Rec."VC Bank Account Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Address"; Rec."Bank Address")
                {
                    ApplicationArea = all;
                }
                field("Bank Address 2"; Rec."Bank Address 2")
                {
                    ApplicationArea = all;
                }
                field("Bank Post Code"; Rec."Bank Post Code")
                {
                    ApplicationArea = all;
                }
                field("Bank City"; Rec."Bank City")
                {
                    ApplicationArea = all;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = all;
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = all;
                }
                field("Bank IFSC Code"; Rec."IFSC Code")
                {
                    ApplicationArea = all;
                }
            }

            group("Log Details")
            {
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = ALL;
                }
                field(IsCreated; Rec.IsCreated)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }

            }

        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }

    }


    actions
    {
        area(Processing)
        {
            action("Create Employee Card")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Employee Card';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HISIntegration: Codeunit "3E HIS Integration Mgmt.";
                begin
                    if Rec."Party Type" = Rec."Party Type"::Employee then
                        HISIntegration.InitEmployeeMaster(Rec."Entry No.");
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Party Type" := Rec."Party Type"::Employee;
    end;

    var
        Employee: Record Employee;

}
