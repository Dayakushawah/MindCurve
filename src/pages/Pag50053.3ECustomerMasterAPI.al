page 50053 "3E Customer Master API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'CustomerMasterAPI';
    DelayedInsert = true;
    EntityName = 'customerMaster';
    EntitySetName = 'customerMasters';
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
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
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
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field("vatBusPostingGroup"; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }

                field(vcBankAccountName; Rec."VC Bank Account Name")
                {
                    Caption = 'Name 2';
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                {
                    Caption = 'Bank Branch No.';
                }
                field(bankPostCode; Rec."Bank Post Code")
                {
                    Caption = 'Bank Post Code';
                }
                field(bankCity; Rec."Bank City")
                {
                    Caption = 'Bank City';
                }
                field(ifscCode; Rec."IFSC Code")
                {
                    Caption = 'IFSC Code';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Party Type" := Rec."Party Type"::Customer;
        //DuplicateCheck();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Party Type" := Rec."Party Type"::Customer;
        //DuplicateCheck();
    end;

    local procedure DuplicateCheck()
    var
        RevenueStaging: Record "3E HIS Master Staging";
    begin
        RevenueStaging.SetRange("Party Type", Rec."Party Type"::Customer);
        RevenueStaging.SetRange("HIS Code", Rec."HIS Code");
        if not RevenueStaging.IsEmpty then
            error('Duplicate Entry');
    end;
}
