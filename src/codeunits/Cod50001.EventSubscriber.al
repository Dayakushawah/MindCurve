codeunit 50001 "3E HIS Event Subscriber"
{

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldGLEntries(GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry");
    begin
        GLEntry."3E Narration" := GenJournalLine."3E Narration";
        GLEntry."3E UTR No." := GenJournalLine."3E UTR No.";
        GLEntry."3E HIS Module" := GenJournalLine."3E HIS Module";
        GLEntry."3E HIS Document Type" := GenJournalLine."3E HIS Document Type";
        GLEntry."3E Store Code" := GenJournalLine."3E Store Code";
        GLEntry."3E Sub Group Code" := GenJournalLine."3E Sub Group Code";
        GLEntry."3E Receipt No." := GenJournalLine."3E Receipt No.";
        GLEntry."3E UHID" := GenJournalLine."3E UHID";
        GLEntry."3E Patient Name" := GenJournalLine."3E Patient Name";
        GLEntry."3E Validation Key" := GenJournalLine."3E Validation Key";
        GLEntry."3E Transaction Type" := GenJournalLine."3E Transaction Type";
        GLEntry."3E Encounter No." := GenJournalLine."3E Encounter No.";
        GLEntry."3E Doctor Name" := GenJournalLine."3E Doctor Name";
        GLEntry."3E Speciality" := GenJournalLine."3E Speciality";
        GLEntry."3E Sponsor Code" := GenJournalLine."3E Sponsor Code";
        GLEntry."3E Sponsor Name" := GenJournalLine."3E Sponsor Name";
        GLEntry."3E Payer Code" := GenJournalLine."3E Payer Code";
        GLEntry."3E Payer Name" := GenJournalLine."3E Payer Name";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."3E HIS Module" := GenJournalLine."3E HIS Module";
        CustLedgerEntry."3E HIS Document Type" := GenJournalLine."3E HIS Document Type";
        CustLedgerEntry."3E Receipt No." := GenJournalLine."3E Receipt No.";
        CustLedgerEntry."3E UHID" := GenJournalLine."3E UHID";
        CustLedgerEntry."3E Patient Name" := GenJournalLine."3E Patient Name";
        CustLedgerEntry."3E Encounter No." := GenJournalLine."3E Encounter No.";
        CustLedgerEntry."3E Doctor Name" := GenJournalLine."3E Doctor Name";
        CustLedgerEntry."3E Speciality" := GenJournalLine."3E Speciality";
        CustLedgerEntry."3E Sponsor Code" := GenJournalLine."3E Sponsor Code";
        CustLedgerEntry."3E Sponsor Name" := GenJournalLine."3E Sponsor Name";
        CustLedgerEntry."3E Payer Code" := GenJournalLine."3E Payer Code";
        CustLedgerEntry."3E Payer Name" := GenJournalLine."3E Payer Name";
        CustLedgerEntry."Sales (LCY)" := GenJournalLine."Sales/Purch. (LCY)";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldVendLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry");
    var
        Vendor: Record "vendor";
    begin
        VendorLedgerEntry."3E Payment Terms Code" := GenJournalLine."Payment Terms Code";
        //VendorLedgerEntry."Purchase Order No." := GenJournalLine."Purchase Order No.";
        // VendorLedgerEntry."3E Narration" := GenJournalLine."3E Narration";
        IF VendorLedgerEntry."Vendor Name" = '' then begin
            IF GenJournalLine."Account Type" = GenJournalLine."Account Type"::Vendor THEN
                IF Vendor.Get(GenJournalLine."Account No.") then
                    VendorLedgerEntry."Vendor Name" := Vendor.Name;

            IF GenJournalLine."Bal. Account Type" = GenJournalLine."Bal. Account Type"::Vendor THEN
                IF Vendor.Get(GenJournalLine."Bal. Account No.") then
                    VendorLedgerEntry."Vendor Name" := Vendor.Name;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldBankLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry");
    begin
        BankAccountLedgerEntry."3E UTR No." := GenJournalLine."3E UTR No.";
        BankAccountLedgerEntry."3E Narration" := GenJournalLine."3E Narration";
    end;

    [EventSubscriber(ObjectType::CodeUnit, codeUnit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', true, true)]
    local procedure ModifyConfimationForPurchaseOrderPosting(PurchaseHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
    begin
        IF ((PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Return Order"))
             AND (PurchaseHeader."3E Item Type" = PurchaseHeader."3E Item Type"::"Non Pharmacy") then begin
            PurchaseHeader.TestField("Location Code");
            PurchLine.RESET();
            PurchLine.SETRANGE("Document Type", PurchaseHeader."Document Type");
            PurchLine.SETRANGE("Document No.", PurchaseHeader."No.");
            PurchLine.SETRANGE("Buy-from Vendor No.", PurchaseHeader."Buy-from Vendor No.");
            PurchLine.SETRANGE(PurchLine.Type, PurchLine.Type::Item);
            IF PurchLine.FindSet() THEN
                repeat
                    IF PurchLine."Location Code" = '' then
                        Error('You can''t post blank Location Cdoe !');
                // IF (PurchLine."3E Item Type" = PurchLine."3E Item Type"::Pharmacy) then
                //     Error('You can''t select Pharmacy Item No. %1,Line No. %2,Item Name %3', PurchLine."No.", PurchLine."Line No.", PurchLine.Description);
                until PurchLine.Next() = 0;

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    begin
        GenJournalLine."3E HIS Module" := SalesHeader."3E HIS Module";
        GenJournalLine."3E HIS Document Type" := SalesHeader."3E HIS Document Type";
        GenJournalLine."3E Receipt No." := SalesHeader."3E Receipt No.";
        GenJournalLine."3E UHID" := SalesHeader."3E UHID";
        GenJournalLine."3E Patient Name" := SalesHeader."3E Patient Name";
        GenJournalLine."3E Encounter No." := SalesHeader."3E Encounter No.";
        GenJournalLine."3E Doctor Name" := SalesHeader."3E Doctor Name";
        GenJournalLine."3E Speciality" := SalesHeader."3E Speciality";
        GenJournalLine."3E Sponsor Code" := SalesHeader."3E Sponsor Code";
        GenJournalLine."3E Sponsor Name" := SalesHeader."3E Sponsor Name";
        GenJournalLine."3E Payer Code" := SalesHeader."3E Payer Code";
        GenJournalLine."3E Payer Name" := SalesHeader."3E Payer Name";
    end;
}
