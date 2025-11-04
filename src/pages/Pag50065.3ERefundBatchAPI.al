page 50065 "3E Refund Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3ERefundsBatchAPI';
    DelayedInsert = true;
    EntityName = 'refundsBatch';
    EntitySetName = 'refundsBatch';
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
            part(RevenueLine; "3E Refund API")
            {
                Caption = 'Refunds';
                EntityName = 'refund';
                EntitySetName = 'refunds';
            }
        }
    }

    var
        BatchNo: Text[100];
}
