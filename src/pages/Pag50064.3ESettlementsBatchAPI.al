page 50064 "3E Settlements Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3eSettlementsBatchAPI';
    DelayedInsert = true;
    EntityName = 'settlementsBatch';
    EntitySetName = 'settlementsBatch';
    SourceTable = "3E HIS Settlement Staging";
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
            part(RevenueLine; "3E Settlement API")
            {
                Caption = 'Settlements';
                EntityName = 'settlement';
                EntitySetName = 'settlements';
            }
        }
    }

    var
        BatchNo: Text[100];
}
