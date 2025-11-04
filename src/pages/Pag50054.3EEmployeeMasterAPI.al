page 50054 "3E Employee Master API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eEmployeeMasterAPI';
    DelayedInsert = true;
    EntityName = 'employeeMaster';
    EntitySetName = 'employeeMasters';
    PageType = API;
    SourceTable = "3E HIS Master Staging";
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(hisCode; Rec."HIS Code")
                {
                    Caption = 'HIS Code';
                    trigger OnValidate()
                    begin
                        DuplicateCheck();
                    end;
                }
                // field(hisType; Rec."HIS Type")
                // {
                //     Caption = 'HIS Type';
                // }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(gender; Rec.Gender)
                {
                    Caption = 'Gender';
                }
                field(birthDate; Rec."Birth Date")
                {
                    Caption = 'DOB';
                }
                field(doj; Rec."Date of Joining")
                {
                    Caption = 'Date of Joining';
                }
                field(dol; Rec."Date of Leaving")
                {
                    Caption = 'Date of Leaving';
                }
                field(designation; Rec.Designation)
                {
                    Caption = 'Designation';
                }
                field(grade; Rec.Grade)
                {
                    Caption = 'Grade';
                }
                field(aadhar; Rec.Aadhar)
                {
                    Caption = 'Aadhar';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(validFrom; Rec."Valid From")
                {
                    Caption = 'Valid From';
                }
                field(validTo; Rec."Valid To")
                {
                    Caption = 'Valid To';
                }
                field(qualification; Rec.Qualification)
                {
                    Caption = 'Qualification';
                }
                field(experience; Rec.Experience)
                {
                    Caption = 'Experience';
                }
                field(registrationNo; Rec."Registration No.")
                {
                    Caption = 'Employee Registration No.';
                }
                field(engagementMode; Rec."Engagement Mode")
                {
                    Caption = 'Engagement Mode';
                }
                field(paymentMode; Rec."Payment Mode")
                {
                    Caption = 'Payment Mode';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(employeePostingGroup; Rec."Employee Posting Group")
                {
                    Caption = 'Employee Posting Group';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(departmentName; Rec."Department Name")
                {
                    Caption = 'Department Name';
                }
                field(subdepartmentName; Rec."Sub Department Name")
                {
                    Caption = 'Sub Department Name';
                }
                field(speciality; Rec.Speciality)
                {
                    Caption = 'Speciality';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Party Type" := Rec."Party Type"::Employee;
        //DuplicateCheck();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Party Type" := Rec."Party Type"::Employee;
        //DuplicateCheck();
    end;

    local procedure DuplicateCheck()
    var
        RevenueStaging: Record "3E HIS Master Staging";
    begin
        RevenueStaging.SetRange("Party Type", Rec."Party Type"::Employee);
        RevenueStaging.SetRange("HIS Code", Rec."HIS Code");
        if not RevenueStaging.IsEmpty then
            error('Duplicate Entry');
    end;
}
