page 50062 "3E Consumption Batch API"
{
    APIGroup = 'apiHIS';
    APIPublisher = 'mindcurve';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = '3EConsumptionBatchAPI';
    DelayedInsert = true;
    EntityName = 'consumptionBatch';
    EntitySetName = 'consumptionBatch';
    SourceTable = "3E HIS Consumption Entries";
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
            part(RevenueLine; "3E Consumption API")
            {
                Caption = 'Consumptions';
                EntityName = 'consumption';
                EntitySetName = 'consumptions';
            }
        }
    }

    var
        BatchNo: Text[100];
}
