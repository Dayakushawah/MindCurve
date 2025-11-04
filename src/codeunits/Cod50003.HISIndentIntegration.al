codeunit 50003 "3E HIS Indent Integration"
{
    Permissions = tabledata "Purch. Inv. Header" = rm,
    tabledata "Purch. Inv. Line" = rm,
    tabledata "Purch. Cr. Memo Hdr." = rm,
    tabledata "Purch. Cr. Memo Line" = rm;

    trigger OnRun()
    begin

    end;

    procedure OrderValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        txtPurchaseAccount: Text[100];
    begin
        txtPurchaseAccount := '';
        HISPurchaseSaleLine.RESET;
        HISPurchaseSaleLine.SetRange("Record Type", RecordType);
        HISPurchaseSaleLine.SetRange("Document Type", DocumentType);
        HISPurchaseSaleLine.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleLine.FINDFIRST THEN BEGIN
            REPEAT

            UNTIL HISPurchaseSaleLine.NEXT = 0;

            HISPurchaseSaleHeader.RESET;
            HISPurchaseSaleHeader.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
            HISPurchaseSaleHeader.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
            HISPurchaseSaleHeader.SETRANGE("Document No.", HISPurchaseSaleLine."Document No.");
            IF HISPurchaseSaleHeader.FINDFIRST THEN
                IF (HISPurchaseSaleHeader."Vendor/Customer Name" = '') OR (txtPurchaseAccount <> '') THEN
                    HISPurchaseSaleHeader."Error Description" := 'Kindly Check Vendor'
                ELSE
                    HISPurchaseSaleHeader."Error Description" := '';
            HISPurchaseSaleHeader.MODIFY;
        END ELSE BEGIN
            HISPurchaseSaleHeader.RESET;
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST THEN BEGIN
                HISPurchaseSaleLine.RESET;
                HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleHeader."Record Type");
                HISPurchaseSaleLine.SetRange("Document Type", HISPurchaseSaleHeader."Document Type");
                HISPurchaseSaleLine.SETRANGE("Document No.", HISPurchaseSaleHeader."Document No.");
                IF NOT HISPurchaseSaleLine.FINDFIRST THEN
                    HISPurchaseSaleHeader."Error Description" := 'Integration Line is Empty';
                HISPurchaseSaleHeader.MODIFY;
            END;
        END;

        HISPurchaseSaleHeader.RESET;
        HISPurchaseSaleHeader.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
        HISPurchaseSaleHeader.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
        HISPurchaseSaleHeader.SETRANGE("Document No.", HISPurchaseSaleLine."Document No.");
        IF HISPurchaseSaleHeader.FINDFIRST THEN BEGIN
            IF (HISPurchaseSaleHeader."Vendor/Customer Name" = '') THEN
                HISPurchaseSaleHeader."Error 1" := TRUE
            ELSE
                HISPurchaseSaleHeader."Error 1" := FALSE;
            IF (txtPurchaseAccount <> '') THEN
                HISPurchaseSaleHeader."Error 2" := TRUE
            ELSE
                HISPurchaseSaleHeader."Error 4" := FALSE;
            HISPurchaseSaleHeader.MODIFY;
        END;

    end;

    procedure OrderReValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        txtPurchaseAccount: Text[100];
    BEGIN
        txtPurchaseAccount := '';
        HISPurchaseSaleLine.RESET;
        HISPurchaseSaleLine.SetRange("Record Type", RecordType);
        HISPurchaseSaleLine.SetRange("Document Type", DocumentType);
        HISPurchaseSaleLine.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleLine.FINDFIRST THEN BEGIN
            REPEAT

                IF HISPurchaseSaleLine."Item Id" = HISPurchaseSaleLine."Purchase Account" THEN BEGIN
                    txtPurchaseAccount := 'Purchase Account'
                END;
            UNTIL HISPurchaseSaleLine.NEXT = 0;

            HISPurchaseSaleHeader.RESET;
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST THEN
                IF (HISPurchaseSaleHeader."Vendor/Customer Name" = '') OR (txtPurchaseAccount <> '') THEN
                    HISPurchaseSaleHeader."Error Description" := 'Revalidation Error found'
                ELSE
                    HISPurchaseSaleHeader."Error Description" := '';

            IF HISPurchaseSaleHeader."Vendor/Customer Name" <> '' THEN BEGIN
                HISPurchaseSaleHeader."Error 1" := FALSE
            END;

            IF txtPurchaseAccount = '' THEN
                HISPurchaseSaleHeader."Error 2" := FALSE;
            HISPurchaseSaleHeader.MODIFY;
        END ELSE BEGIN
            HISPurchaseSaleHeader.RESET;
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST THEN BEGIN
                HISPurchaseSaleLine.RESET;
                HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
                HISPurchaseSaleLine.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
                HISPurchaseSaleLine.SETRANGE("Document No.", HISPurchaseSaleHeader."Document No.");
                IF NOT HISPurchaseSaleLine.FINDFIRST THEN
                    HISPurchaseSaleHeader."Error Description" := 'Integration Line is Empty';
                HISPurchaseSaleHeader.MODIFY;
            END;
        END;


    END;

    procedure InitPurchaseOrder(RecordType: Option; DocumentType: Option; DocumentNo: CODE[20])
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        LineNo: Integer;
    begin
        IntegrationSetup.GET;
        OrderValidation(RecordType, documentType, DocumentNo);


        HISPurchaseSaleHeader.RESET;
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Document No.", DocumentNo);
        HISPurchaseSaleHeader.SETRANGE("rECORD tYPE", HISPurchaseSaleHeader."rECORD tYPE");
        HISPurchaseSaleHeader.SETRANGE("Document Type", HISPurchaseSaleHeader."Document Type");
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Create PO", FALSE);
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Vendor/Customer No.", '<>%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Error Description", '%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."No. of Lines", '<>%1', 0);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 1", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 2", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 3", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 4", FALSE);
        IF HISPurchaseSaleHeader.FINDFIRST THEN BEGIN
            PurchHeader.INIT;
            IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::Purchase) AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::Invoice) THEN BEGIN
                PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice
            END ELSE
                IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::"Purchase Return") AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::"Credit Memo") THEN
                    PurchHeader."Document Type" := PurchHeader."Document Type"::"Credit Memo";

            PurchHeader."No." := HISPurchaseSaleHeader."Document No.";
            PurchHeader.INSERT(TRUE);
            PurchHeader.VALIDATE("Buy-from Vendor No.", HISPurchaseSaleHeader."Vendor/Customer No.");
            PurchHeader.VALIDATE("Order Date", HISPurchaseSaleHeader."Document Date");
            PurchHeader.VALIDATE("Posting Date", HISPurchaseSaleHeader."Posting Date");
            PurchHeader.VALIDATE("Vendor Invoice No.", HISPurchaseSaleHeader."Invoice No.");
            PurchHeader.VALIDATE("Location Code", HISPurchaseSaleHeader."Location Code");
            PurchHeader.VALIDATE(PurchHeader."Shortcut Dimension 1 Code", HISPurchaseSaleHeader."Shortcut Dimension 1 Code");
            PurchHeader.VALIDATE(PurchHeader."Shortcut Dimension 2 Code", HISPurchaseSaleHeader."Shortcut Dimension 2 Code");
            PurchHeader.VALIDATE(PurchHeader."Vendor Order No.", HISPurchaseSaleHeader."Indent Order No.");
            PurchHeader.VALIDATE(PurchHeader."Order Amount", HISPurchaseSaleHeader.Amount);
            PurchHeader.VALIDATE(PurchHeader."Vendor Cr. Memo No.", HISPurchaseSaleHeader."Document No.");
            PurchHeader.VALIDATE("Posting No. Series", '');
            PurchHeader.VALIDATE("Posting No.", HISPurchaseSaleHeader."Document No.");
            //PurchHeader.Validate("Reference No.", HISPurchaseSaleHeader."Reference No.");
            PurchHeader."Indent Amount" := HISPurchaseSaleHeader.Amount;
            //PurchHeader."Order Amount" := HISPurchaseSaleHeader.Amount;
            //PurchHeader."Integration PO Created" := HISPurchaseSaleHeader."Integration PO Created";
            PurchHeader."Integration PO Created" := TRUE;
            PurchHeader.MODIFY;
            LineNo := 0;

            HISPurchaseSaleLine.RESET;
            HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleHeader."Record Type");
            HISPurchaseSaleLine.SetRange("document Type", HISPurchaseSaleHeader."document Type");
            HISPurchaseSaleLine.SETRANGE(HISPurchaseSaleLine."Document No.", PurchHeader."No.");
            IF HISPurchaseSaleLine.FINDFIRST THEN
                REPEAT
                    LineNo += 10000;
                    PurchLine.INIT;
                    PurchLine.VALIDATE("Document Type", PurchHeader."Document Type");
                    PurchLine."Document No." := PurchHeader."No.";
                    PurchLine.VALIDATE("Line No.", LineNo);
                    PurchLine.VALIDATE(Type, HISPurchaseSaleLine."Item Type");
                    IntegrationSetup.Get();
                    IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then begin
                        PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Purchase Account")
                    end else begin
                        IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then
                            PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Item No.")
                    end;

                    IF HISPurchaseSaleLine."Received QTY" <> 0 THEN
                        PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Received QTY")
                    ELSE
                        PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Free QTY");
                    PurchLine.VALIDATE("Location Code", HISPurchaseSaleLine."Location Code");
                    PurchLine.VALIDATE("Direct Unit Cost", HISPurchaseSaleLine."Unit Cost");
                    PurchLine.VALIDATE(PurchLine."Shortcut Dimension 1 Code", HISPurchaseSaleLine."Shortcut Dimension 1 Code");
                    PurchLine.VALIDATE(PurchLine."Shortcut Dimension 2 Code", HISPurchaseSaleLine."Shortcut Dimension 2 Code");
                    PurchLine.Description := COPYSTR(HISPurchaseSaleLine."Item Name", 1, 100);
                    PurchLine.VALIDATE("Line Discount Amount", HISPurchaseSaleLine.Discount);
                    PurchLine."Vendor Item No." := HISPurchaseSaleLine."Item No.";

                    PurchLine.INSERT(TRUE);
                UNTIL HISPurchaseSaleLine.NEXT = 0;
            HISPurchaseSaleHeader."Create PO" := TRUE;
            HISPurchaseSaleHeader.MODIFY;

        END;


    end;

    procedure InitSalesOrder(RecordType: Option; DocumentType: Option; DocumentNo: CODE[20])
    var
        PurchHeader: Record "Sales Header";
        PurchLine: Record "Sales Line";
        LineNo: Integer;
    begin
        IntegrationSetup.GET;
        OrderValidation(RecordType, documentType, DocumentNo);


        HISPurchaseSaleHeader.RESET;
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Document No.", DocumentNo);
        HISPurchaseSaleHeader.SETRANGE("rECORD tYPE", HISPurchaseSaleHeader."rECORD tYPE");
        HISPurchaseSaleHeader.SETRANGE("Document Type", HISPurchaseSaleHeader."Document Type");
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Create PO", FALSE);
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Vendor/Customer No.", '<>%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Error Description", '%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."No. of Lines", '<>%1', 0);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 1", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 2", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 3", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 4", FALSE);
        IF HISPurchaseSaleHeader.FINDFIRST THEN BEGIN
            PurchHeader.INIT;
            IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::Sales) AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::Invoice) THEN BEGIN
                PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice
            END ELSE
                IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::"Sales Return") AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::"Credit Memo") THEN
                    PurchHeader."Document Type" := PurchHeader."Document Type"::"Credit Memo";

            PurchHeader."No." := HISPurchaseSaleHeader."Document No.";
            PurchHeader.INSERT(TRUE);
            PurchHeader.VALIDATE("Sell-to Customer No.", HISPurchaseSaleHeader."Vendor/Customer No.");
            PurchHeader.VALIDATE("Order Date", HISPurchaseSaleHeader."Document Date");
            PurchHeader.VALIDATE("Posting Date", HISPurchaseSaleHeader."Posting Date");
            PurchHeader.VALIDATE("External Document No.", HISPurchaseSaleHeader."Invoice No.");
            PurchHeader.VALIDATE("Location Code", HISPurchaseSaleHeader."Location Code");
            PurchHeader.VALIDATE(PurchHeader."Shortcut Dimension 1 Code", HISPurchaseSaleHeader."Shortcut Dimension 1 Code");
            PurchHeader.VALIDATE(PurchHeader."Shortcut Dimension 2 Code", HISPurchaseSaleHeader."Shortcut Dimension 2 Code");
            PurchHeader.VALIDATE(PurchHeader."Your Reference", HISPurchaseSaleHeader."Indent Order No.");
            PurchHeader.VALIDATE("Posting No. Series", '');
            PurchHeader.VALIDATE("Posting No.", HISPurchaseSaleHeader."Document No.");
            PurchHeader.Validate("Station Name", HISPurchaseSaleHeader."Station Name");
            PurchHeader."Indent Amount" := HISPurchaseSaleHeader.Amount;
            PurchHeader."Order Amount" := HISPurchaseSaleHeader.Amount;
            PurchHeader."Integration PO Created" := TRUE;
            PurchHeader.MODIFY;
            LineNo := 0;
            HISPurchaseSaleLine.RESET;
            HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleHeader."Record Type");
            HISPurchaseSaleLine.SetRange("document Type", HISPurchaseSaleHeader."document Type");
            HISPurchaseSaleLine.SETRANGE(HISPurchaseSaleLine."Document No.", PurchHeader."No.");
            IF HISPurchaseSaleLine.FINDFIRST THEN
                REPEAT
                    LineNo += 10000;
                    PurchLine.INIT;
                    PurchLine.VALIDATE("Document Type", PurchHeader."Document Type");
                    PurchLine."Document No." := PurchHeader."No.";
                    PurchLine.VALIDATE("Line No.", LineNo);
                    PurchLine.VALIDATE(Type, HISPurchaseSaleLine."Item Type");
                    IntegrationSetup.Get();
                    IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then begin
                        PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Purchase Account")
                    end else begin
                        IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then
                            PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Item No.")
                    end;

                    IF HISPurchaseSaleLine."Received QTY" <> 0 THEN
                        //PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Received QTY")
                        PurchLine.VALIDATE(Quantity, 1)
                    ELSE
                        PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Free QTY");
                    PurchLine.VALIDATE("Location Code", HISPurchaseSaleLine."Location Code");
                    //PurchLine.VALIDATE(PurchLine."Unit Price", HISPurchaseSaleLine."Unit Cost");
                    PurchLine.VALIDATE(PurchLine."Unit Price", HISPurchaseSaleLine.Amount);
                    PurchLine.VALIDATE(PurchLine."Shortcut Dimension 1 Code", HISPurchaseSaleLine."Shortcut Dimension 1 Code");
                    PurchLine.VALIDATE(PurchLine."Shortcut Dimension 2 Code", HISPurchaseSaleLine."Shortcut Dimension 2 Code");
                    PurchLine.Description := COPYSTR(HISPurchaseSaleLine."Item Name", 1, 100);
                    PurchLine.VALIDATE("Line Discount Amount", HISPurchaseSaleLine.Discount);
                    PurchLine.VALIDATE(PurchLine."BatchNo", HISPurchaseSaleLine."BatchNo");
                    PurchLine.VALIDATE(PurchLine."ExpiryDate", HISPurchaseSaleLine."ExpiryDate");
                    PurchLine.VALIDATE(PurchLine."Item Category Code", HISPurchaseSaleLine."Item Category Code");
                    //PurchLine.VALIDATE(PurchLine."Product Group Code", HISPurchaseSaleLine."Product Group Code");
                    PurchLine.VALIDATE(PurchLine."Indent No", HISPurchaseSaleLine."Indent No");
                    PurchLine.VALIDATE(PurchLine."Station SI No", HISPurchaseSaleLine."Station SI No");

                    //PurchLine."Customer Item No." := HISPurchaseSaleLine."Item No.";

                    PurchLine.INSERT(TRUE);
                UNTIL HISPurchaseSaleLine.NEXT = 0;
            HISPurchaseSaleHeader."Create PO" := TRUE;
            HISPurchaseSaleHeader.MODIFY;

        END;


    end;

    procedure PostGenJnlLineEntries()
    var
        GenJnlLine: Record "Gen. Journal Line";
        HISIntegrationSetupLine: Record "3E HIS Integration Setup Line";
        GenJournalLine1: Record "Gen. Journal Line";
        GenJnlPostBatch: Codeunit "Gen. Jnl.-Post Batch";
    begin
        IntegrationSetup.GET;
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Revenue Creation Enabled") THEN
            EXIT;

        GenJnlLine.RESET;
        GenJnlLine.SETFILTER(GenJnlLine."Account No.", '%1', '');
        GenJnlLine.SETFILTER(GenJnlLine.Amount, '%1', 0);
        IF GenJnlLine.FINDFIRST THEN BEGIN
            GenJnlLine.DELETEALL;
        END;
        HISIntegrationSetupLine.Reset();
        IF HISIntegrationSetupLine.FindFirst() then begin
            repeat
                GenJnlLine.RESET;
                GenJnlLine.SETRANGE("Journal Template Name", HISIntegrationSetupLine."General Journal Template Code");
                GenJnlLine.SETRANGE("Journal Batch Name", HISIntegrationSetupLine."General Journal Batch Code");
                IF GenJnlLine.FINDFIRST THEN BEGIN
                    REPEAT
                        GenJournalLine1.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                        GenJournalLine1.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                        GenJournalLine1.SETRANGE("Document No.", GenJnlLine."Document No.");
                        GenJournalLine1.SETRANGE("Posting Date", GenJnlLine."Posting Date");
                        IF GenJournalLine1.FINDFIRST THEN
                            REPEAT
                                GenJnlPostBatch.RUN(GenJournalLine1);
                            UNTIL GenJournalLine1.NEXT = 0;
                    UNTIL GenJnlLine.NEXT = 0;
                END else
                    Message('There is no HIS Entries Pending for the Posting');
            until HISIntegrationSetupLine.Next() = 0;
        end;
    end;

    var
        myInt: Integer;
        IntegrationSetup: Record "3E HIS Integartion Setup";
        GSTState: Code[2];
        HISPurchaseSaleHeader: Record "3E HIS Indent Header";
        HISPurchaseSaleLine: Record "3E HIS Indent Line";
        GeneralLedgerSetup: Record "General Ledger Setup";
        PurchaseInvoiceHeader: Record "Purch. Inv. Header";
        PurchaseCreditMemoHeader: Record "Purch. Cr. Memo Hdr.";
        DimensionSetEntry: Record "Dimension Set Entry";
}