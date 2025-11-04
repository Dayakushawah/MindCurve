report 50001 "Vendor Ledger Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reports/Rpt50001.VendorLedgerReport.rdl';
    Caption = 'Vendor Ledger Report';
    ApplicationArea = aLL;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            column(Document_No_; "Document No.")
            {

            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        myInt: Integer;
}