page 50038 "3E HIS Revenue List"
{

    ApplicationArea = All;
    Caption = 'HIS Revenue List';
    PageType = List;
    Editable = false;
    CardPageId = "3E HIS Revenue Header";
    InsertAllowed = false;
    SourceTable = "3E HIS Revenue Header";
    SourceTableView = sorting("Entry No.") where("Record Type" = Filter(Revenue), "Document Type" = filter(Invoice), "Create Revenue" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field("Record Type"; Rec."Record Type")
                // {
                //     ToolTip = 'Specifies the value of the Record Type field';
                //     ApplicationArea = All;
                // }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ToolTip = 'Specifies the value of the Document Type field';
                //     ApplicationArea = All;
                // }
                field("HIS Document Type"; Rec."HIS Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HIS Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field';
                    ApplicationArea = All;
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Patient Name field.';
                    Caption = 'Patient Name';
                }
                field(UHID; Rec.UHID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UHID field.';
                    Caption = 'UHID';
                }
                field("Encounter No."; Rec."Encounter No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Encounter No. field.';
                    Caption = 'Encounter No.';
                }

                field(Doctor; Rec.Doctor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Doctor field.';
                    Caption = 'Doctor';
                }
                field(Speciality; Rec.Speciality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Speciality field.';
                    Caption = 'Speciality';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field';
                    ApplicationArea = All;
                    Caption = 'Unit Code';
                }
                field("Sponsor Code"; Rec."Sponsor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Code field.';
                    Caption = 'Sponsor Code';
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sponsor Name field.';
                    Caption = 'Sponsor Name';
                }
                field("Payer Code"; Rec."Payer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Code field.';
                    Caption = 'Payer Code';
                }
                field("Payer Name"; Rec."Payer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Name field.';
                    Caption = 'Payer Name';
                }
                field("Payor Category"; Rec."Payor Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payor Category field.';
                    Caption = 'Payor Category';
                }
                field("Admission Date Time"; Rec."Admission Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Date Time field.';
                    Caption = 'Admission Date Time';
                    Visible = false;
                }
                field("Discharge Date Time"; Rec."Discharge Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discharge Date Time field.';
                    Caption = 'Discharge Date Time';
                    Visible = false;
                }
                field("Admission Source"; Rec."Admission Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Source field.';
                    Caption = 'Admission Source';
                }
                field("Package Patient"; Rec."Package Patient")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Package Patient field.';
                    Caption = 'Package Patient';
                    Visible = false;
                }
                field("Admission Bed Category"; Rec."Admission Bed Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission Bed Category field.';
                    Caption = 'Admission Bed Category';
                    Visible = false;
                }
                field("Discharge Bed Category"; Rec."Discharge Bed Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discharge Bed Category field.';
                    Caption = 'Discharge Bed Category';
                    Visible = false;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                    Caption = 'Error Description';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
                field("Error 1"; Rec."Error 1")
                {
                    Caption = 'Customer Error';
                    ToolTip = 'Specifies the value of the Error 1 field.';
                }
                field("Error 2"; Rec."Error 2")
                {
                    Caption = 'Revenue Setup Missing';
                    ToolTip = 'Specifies the value of the Error 2 field.';
                }

            }

        }

    }

    actions
    {
        area(Processing)
        {
            action(DeleteSelected)
            {
                ApplicationArea = All;
                Caption = 'Delete Selected';
                Image = DeleteRow;
                ToolTip = 'Executes the Delete Selected action.';
                trigger OnAction()
                var
                    RevDelHeader: Record "3E HIS Revenue Header";
                begin
                    CurrPage.SetSelectionFilter(RevHeader);
                    if RevHeader.FindSet() then
                        repeat
                            RevDelHeader := RevHeader;
                            RevDelHeader.Delete(true);
                        until RevHeader.Next() = 0;
                end;
            }

            action(MarkCreatedSelected)
            {
                ApplicationArea = All;
                Caption = 'Mard Created Selected';
                Image = DeleteRow;
                ToolTip = 'Executes the Created Selected action.';
                trigger OnAction()
                var
                    RevDelHeader: Record "3E HIS Revenue Header";
                begin
                    CurrPage.SetSelectionFilter(RevHeader);
                    if RevHeader.FindSet() then
                        repeat
                            RevDelHeader := RevHeader;
                            RevDelHeader."Create Revenue" := true;
                            RevDelHeader.Modify();
                        until RevHeader.Next() = 0;
                end;
            }
        }
    }

    var
        RevHeader: Record "3E HIS Revenue Header";
}
