page 50063 "3E Advances Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eAdvancesBatchAPI';
    DelayedInsert = true;
    EntityName = 'advanceBatch';
    EntitySetName = 'advanceBatch';
    SourceTable = "3E HIS Revenue Staging Table";
    SourceTableTemporary = true;
    PageType = API;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(batchNo; BatchNo)
                {
                    Caption = 'Batch No.';

                    trigger OnValidate()
                    begin
                        Rec.Init();
                        Rec.Insert();
                    end;
                }
            }
            part(RevenueLine; "3E Advances API")
            {
                Caption = 'Advances';
                EntityName = 'advance';
                EntitySetName = 'advances';
            }
        }
    }

    var
        BatchNo: Text[100];
}
