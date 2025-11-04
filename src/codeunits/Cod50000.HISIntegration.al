codeunit 50000 "3E HIS Integration Mgmt."
{
    Permissions = tabledata "Purch. Inv. Header" = rm,
    tabledata "Purch. Inv. Line" = rm,
    tabledata "Purch. Cr. Memo Hdr." = rm,
    tabledata "Purch. Cr. Memo Line" = rm;

    trigger OnRun()
    begin
    end;

    procedure InitVendorMaster(EntryNo: Integer)
    var
        VendorRec: Record Vendor;
        VendorPostingGroup: Record "Vendor Posting Group";
        Vendor1: Record Vendor;
        VendBankAccount: Record "Vendor Bank Account";
        PANNo: Code[10];
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Gen. Bus. Posting Group");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Vendor Creation Enabled") THEN
            EXIT;
        HisMasterStaging.RESET();
        HisMasterStaging.SETRANGE("Entry No.", EntryNo);
        HisMasterStaging.SETRANGE(IsCreated, FALSE);
        HisMasterStaging.SETRANGE("Party Type", HisMasterStaging."Party Type"::Vendor);
        HisMasterStaging.SETFILTER("Error Description", '%1', '');
        HisMasterStaging.SETFILTER("HIS Code", '<>%1', '');
        IF HisMasterStaging.FINDSET() THEN
            REPEAT
                HisMasterStaging.TestField("Gen. Bus. Posting Group");
                HisMasterStaging.TestField("VENDOR Posting Group");

                HisMasterStaging.TestField("HIS Code");

                Vendor1.RESET();
                Vendor1.SETRANGE("3E HIS Code", HisMasterStaging."HIS Code");
                IF NOT Vendor1.FINDFIRST() THEN BEGIN
                    VendorPostingGroup.RESET();
                    VendorPostingGroup.SETRANGE(Code, HisMasterStaging."Vendor Posting Group");
                    IF VendorPostingGroup.FINDFIRST() THEN BEGIN
                        HisMasterStaging.TESTFIELD("VAT Registration No.");

                    END;
                    VendorRec.INIT();
                    VendorRec.VALIDATE("No.", HisMasterStaging."HIS Code");
                    VendorRec.VALIDATE(Name, HisMasterStaging.Name);
                    VendorRec."Name 2" := COPYSTR(HisMasterStaging."Name 2", 1, 50);
                    ;
                    VendorRec.Address := COPYSTR(HisMasterStaging.Address, 1, 50);
                    VendorRec."Address 2" := COPYSTR(HisMasterStaging."Address 2", 1, 50);
                    VendorRec.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    VendorRec.VALIDATE(City, HisMasterStaging.City);
                    VendorRec.Contact := HisMasterStaging.Contact;
                    VendorRec."Phone No." := HisMasterStaging."Phone No.";
                    VendorRec.INSERT();
                    VendorRec.VALIDATE("Vendor Posting Group", HisMasterStaging."Vendor Posting Group");
                    VendorRec.VALIDATE("Country/Region Code", HisMasterStaging."Country/Region Code");
                    VendorRec.VALIDATE("Gen. Bus. Posting Group", 'GEN');
                    VendorRec.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    VendorRec.Validate("Country/Region Code", HisMasterStaging.County);
                    VendorRec.Validate("Global Dimension 1 Code", HisMasterStaging."Global Dimension 1 Code");
                    VendorRec.Validate("Location Code", HisMasterStaging."Global Dimension 1 Code");
                    VendorRec.Validate("Responsibility Center", HisMasterStaging."Global Dimension 1 Code");
                    VendorRec."Application Method" := HisMasterStaging."Application Method";
                    VendorRec."Payment Terms Code" := HisMasterStaging."Payment Terms Code";
                    VendorRec."VAT Registration No." := HisMasterStaging."VAT Registration No.";
                    VendorRec."3E HIS Code" := HisMasterStaging."HIS Code";
                    VendorRec.MODIFY();
                    IF HisMasterStaging."Bank Account No." <> '' THEN begin
                        VendBankAccount.Init();
                        VendBankAccount.VALIDATE("Vendor No.", VendorRec."No.");
                        VendBankAccount.VALIDATE(Code, 'HIS' + '-' + COPYSTR(VendorRec."No.", 1, 16));
                        VendBankAccount.VALIDATE(Name, HisMasterStaging."VC Bank Account Name");
                        VendBankAccount.VALIDATE(Address, HisMasterStaging.Address);
                        VendBankAccount.VALIDATE("Address 2", HisMasterStaging."Address 2");
                        VendBankAccount.VALIDATE("Bank Account No.", HisMasterStaging."Bank Account No.");
                        VendBankAccount.VALIDATE("Bank Branch No.", HisMasterStaging."Bank Branch No.");
                        VendBankAccount.Validate("Post Code", HisMasterStaging."Bank Post Code");
                        VendBankAccount.Validate(City, HisMasterStaging."Bank City");
                        VendBankAccount.Insert();
                    end;

                    HisMasterStaging."Vendor/Customer Code" := VendorRec."No.";
                    HisMasterStaging.IsCreated := TRUE;
                    HisMasterStaging."Modified by" := UserId;
                    HisMasterStaging."Modified Date Time" := CurrentDateTime;
                    HisMasterStaging.MODIFY();
                    MESSAGE('Vendor has been created Successfully');
                END ELSE BEGIN
                    HisMasterStaging."Error Description" := 'Check Vendor Posting Group';
                    MESSAGE('Vendor Posting Group not Exists');
                END;
                HisMasterStaging.MODIFY();
            UNTIL HisMasterStaging.NEXT() = 0
        ELSE
            Error('HIS Code is missing.Kindly check Error Desciption');
    end;

    procedure InitDoctorMaster(EntryNo: Integer)
    var
        VendorRec: Record Vendor;
        VendorPostingGroup: Record "Vendor Posting Group";
        Vendor1: Record Vendor;
        VendBankAccount: Record "Vendor Bank Account";
        PANNo: Code[10];
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Gen. Bus. Posting Group");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Vendor Creation Enabled") THEN
            EXIT;
        HisMasterStaging.RESET();
        HisMasterStaging.SETRANGE("Entry No.", EntryNo);
        HisMasterStaging.SETRANGE(IsCreated, FALSE);
        HisMasterStaging.SETRANGE("Party Type", HisMasterStaging."Party Type"::Doctor);
        HisMasterStaging.SETFILTER("Error Description", '%1', '');
        HisMasterStaging.SETFILTER("HIS Code", '<>%1', '');
        IF HisMasterStaging.FINDSET() THEN
            REPEAT
                HisMasterStaging.TestField("Gen. Bus. Posting Group");
                HisMasterStaging.TestField("VENDOR Posting Group");

                HisMasterStaging.TestField("HIS Code");

                Vendor1.RESET();
                Vendor1.SETRANGE("3E HIS Code", HisMasterStaging."HIS Code");
                IF NOT Vendor1.FINDFIRST() THEN BEGIN
                    VendorPostingGroup.RESET();
                    VendorPostingGroup.SETRANGE(Code, HisMasterStaging."Vendor Posting Group");
                    IF VendorPostingGroup.FINDFIRST() THEN begin
                        HisMasterStaging.TESTFIELD("VAT Registration No.");

                    END;
                    VendorRec.INIT();
                    VendorRec.VALIDATE("No.", HisMasterStaging."HIS Code");
                    VendorRec.VALIDATE(Name, HisMasterStaging.Name);
                    VendorRec."Name 2" := COPYSTR(HisMasterStaging."Name 2", 1, 50);
                    ;
                    VendorRec.Address := COPYSTR(HisMasterStaging.Address, 1, 50);
                    VendorRec."Address 2" := COPYSTR(HisMasterStaging."Address 2", 1, 50);
                    VendorRec.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    VendorRec.VALIDATE(City, HisMasterStaging.City);
                    VendorRec.Contact := HisMasterStaging.Contact;
                    VendorRec."Phone No." := HisMasterStaging."Phone No.";
                    VendorRec.INSERT();
                    VendorRec.VALIDATE("Vendor Posting Group", HisMasterStaging."Vendor Posting Group");
                    VendorRec.VALIDATE("Country/Region Code", HisMasterStaging."Country/Region Code");
                    VendorRec.VALIDATE("Gen. Bus. Posting Group", HisMasterStaging."Gen. Bus. Posting Group");
                    VendorRec.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    VendorRec.Validate("Country/Region Code", HisMasterStaging.County);
                    VendorRec.Validate("Global Dimension 1 Code", HisMasterStaging."Global Dimension 1 Code");
                    VendorRec."VAT Registration No." := HisMasterStaging."VAT Registration No.";
                    VendorRec."Application Method" := HisMasterStaging."Application Method";
                    VendorRec."Payment Terms Code" := HisMasterStaging."Payment Terms Code";
                    VendorRec."3E HIS Code" := HisMasterStaging."HIS Code";
                    VendorRec.MODIFY();
                    IF HisMasterStaging."Bank Account No." <> '' THEN begin
                        VendBankAccount.Init();
                        VendBankAccount.VALIDATE("Vendor No.", VendorRec."No.");
                        VendBankAccount.VALIDATE(Code, 'HIS' + '-' + COPYSTR(VendorRec."No.", 1, 16));
                        VendBankAccount.VALIDATE(Name, HisMasterStaging."VC Bank Account Name");
                        VendBankAccount.VALIDATE(Address, HisMasterStaging.Address);
                        VendBankAccount.VALIDATE("Address 2", HisMasterStaging."Address 2");
                        VendBankAccount.VALIDATE("Bank Account No.", HisMasterStaging."Bank Account No.");
                        VendBankAccount.VALIDATE("Bank Branch No.", HisMasterStaging."Bank Branch No.");
                        VendBankAccount.Validate("Post Code", HisMasterStaging."Bank Post Code");
                        VendBankAccount.Validate(City, HisMasterStaging."Bank City");
                        VendBankAccount.Insert();
                    end;

                    HisMasterStaging."Vendor/Customer Code" := VendorRec."No.";
                    HisMasterStaging.IsCreated := TRUE;
                    HisMasterStaging."Modified by" := UserId;
                    HisMasterStaging."Modified Date Time" := CurrentDateTime;
                    HisMasterStaging.MODIFY();
                    MESSAGE('Doctor has been created Successfully');
                END ELSE BEGIN
                    HisMasterStaging."Error Description" := 'Check Doctor Posting Group';
                    MESSAGE('Doctor Posting Group not Exists');
                END;
                HisMasterStaging.MODIFY();
            UNTIL HisMasterStaging.NEXT() = 0
        ELSE
            Error('HIS Code is missing.Kindly check Error Desciption');
    end;


    procedure InitCustomerMaster(EntryNo: Integer)
    var
        Customer1: Record Customer;
        CustomerPostingGroup: Record "Customer Posting Group";
        Customer: Record "Customer";
        CustBankAccount: Record "Customer Bank Account";
    BEGIN
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Customer Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Custom Gen. Bus. Posting Group");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Customer Creation Enabled") THEN
            EXIT;
        HisMasterStaging.RESET();
        HisMasterStaging.SETRANGE("Party Type", HisMasterStaging."Party Type"::Customer);
        HisMasterStaging.SETRANGE("Entry No.", EntryNo);
        HisMasterStaging.SETRANGE(IsCreated, FALSE);
        HisMasterStaging.SETFILTER("HIS Code", '<>%1', '');
        HisMasterStaging.SETFILTER("Error Description", '%1', '');
        IF HisMasterStaging.FINDSET() THEN
            REPEAT
                HisMasterStaging.TestField("Gen. Bus. Posting Group");
                HisMasterStaging.TestField("Customer Posting Group");

                HisMasterStaging.TestField("HIS Code");
                Customer1.RESET();
                Customer1.SETRANGE("3E HIS Code", HisMasterStaging."HIS Code");
                IF NOT Customer1.FINDFIRST() THEN BEGIN
                    CustomerPostingGroup.RESET();
                    CustomerPostingGroup.SETRANGE(Code, HisMasterStaging."Customer Posting Group");
                    IF CustomerPostingGroup.FINDFIRST() THEN BEGIN
                        HisMasterStaging.TESTFIELD("Global Dimension 1 Code");
                    END;
                    Customer.INIT();
                    Customer.VALIDATE("No.", HisMasterStaging."HIS Code");
                    Customer.VALIDATE(Name, HisMasterStaging.Name);
                    Customer."Name 2" := COPYSTR(HisMasterStaging."Name 2", 1, 50);
                    Customer.Address := HisMasterStaging.Address;
                    Customer."Address 2" := HisMasterStaging."Address 2";
                    Customer.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    Customer.VALIDATE(City, HisMasterStaging.City);
                    Customer.Contact := HisMasterStaging.Contact;
                    Customer."Phone No." := HisMasterStaging."Phone No.";
                    Customer.INSERT();
                    Customer.VALIDATE("Customer Posting Group", HisMasterStaging."Customer Posting Group");
                    Customer.VALIDATE("Country/Region Code", HisMasterStaging."Country/Region Code");
                    Customer.VALIDATE("Gen. Bus. Posting Group", HisMasterStaging."Gen. Bus. Posting Group");
                    Customer.VALIDATE("Post Code", HisMasterStaging."Post Code");
                    Customer.Validate("Country/Region Code", HisMasterStaging.County);
                    Customer."VAT Registration No." := HisMasterStaging."VAT Registration No.";
                    Customer.VALIDATE("3E HIS Code", HisMasterStaging."HIS Code");
                    Customer.Validate("Global Dimension 1 Code", HisMasterStaging."Global Dimension 1 Code");
                    Customer.Validate("Location Code", HisMasterStaging."Global Dimension 1 Code");
                    Customer.Validate("Responsibility Center", HisMasterStaging."Global Dimension 1 Code");
                    Customer."3E HIS Code" := HisMasterStaging."HIS Code";
                    Customer.MODIFY();
                    IF HisMasterStaging."Bank Account No." <> '' THEN begin
                        CustBankAccount.Init();
                        CustBankAccount.VALIDATE("Customer No.", Customer."No.");
                        CustBankAccount.VALIDATE(Code, 'HIS' + '-' + COPYSTR(Customer."No.", 1, 16));
                        CustBankAccount.VALIDATE(Name, HisMasterStaging."VC Bank Account Name");
                        CustBankAccount.VALIDATE(Address, HisMasterStaging.Address);
                        CustBankAccount.VALIDATE("Address 2", HisMasterStaging."Address 2");
                        CustBankAccount.VALIDATE("Bank Account No.", HisMasterStaging."Bank Account No.");
                        CustBankAccount.VALIDATE("Bank Branch No.", HisMasterStaging."Bank Branch No.");
                        CustBankAccount.Validate("Post Code", HisMasterStaging."Bank Post Code");
                        CustBankAccount.Validate(City, HisMasterStaging."Bank City");
                        CustBankAccount.Insert();
                    end;

                    HisMasterStaging."Vendor/Customer Code" := Customer."No.";
                    HisMasterStaging.IsCreated := TRUE;
                    HisMasterStaging."Modified by" := USERID;
                    HisMasterStaging."Modified Date Time" := CurrentDateTime;
                    HisMasterStaging.MODIFY();
                    MESSAGE('Customer has been created Successfully');
                END ELSE
                    HisMasterStaging."Error Description" := 'Check Customer Posting Group';
                HisMasterStaging.MODIFY();
            UNTIL HisMasterStaging.NEXT() = 0
        ELSE
            Error('HIS Code is missing.Kindly check Error Desciption');
    END;

    procedure InitItemMaster(EntryNo: Integer)
    var
        Item1: Record Item;
        InventoryPostingGroup: Record "Inventory Posting Group";
        Item: Record "item";
        ItemUnitofMeasure: Record "Item Unit of Measure";
        HISUOMMapping: Record "3E HIS UOM Mapping";

    BEGIN
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Item Creation Enabled", TRUE);

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Item Creation Enabled") THEN
            EXIT;

        HisMasterStaging.RESET();
        HisMasterStaging.SETRANGE("Party Type", HisMasterStaging."Party Type"::Item);
        HisMasterStaging.SETRANGE("Entry No.", EntryNo);
        HisMasterStaging.SETRANGE(IsCreated, FALSE);
        HisMasterStaging.SETFILTER(Name, '<>%1', '');
        HisMasterStaging.SETFILTER("Error Description", '%1', '');
        IF HisMasterStaging.FINDSET() THEN
            REPEAT
                HisMasterStaging.TestField("Gen. Prod. Posting Group");
                HisMasterStaging.TestField("Base Unit of Measure");
                HisMasterStaging.TestField("HIS Code");
                Item1.RESET();
                Item1.SETRANGE("No.", HisMasterStaging."HIS Code");
                Item1.SETRANGE(Description, HisMasterStaging.Name);
                IF NOT Item1.FINDFIRST() THEN BEGIN
                    // InventoryPostingGroup.RESET();
                    // InventoryPostingGroup.SETRANGE(Code, HisMasterStaging."Inventory Posting Group");
                    // IF InventoryPostingGroup.FINDFIRST() THEN BEGIN
                    Item.INIT();
                    Item.VALIDATE("No.", HisMasterStaging."HIS Code");
                    Item.VALIDATE(Description, HisMasterStaging."Name");
                    Item.INSERT();
                    Item.VALIDATE(Item."Item Category Code", HisMasterStaging."Item Category Code");
                    Item.VALIDATE(item."Gen. Prod. Posting Group", HisMasterStaging."Gen. Prod. Posting Group");
                    HISUOMMapping.Get(HisMasterStaging."Base Unit of Measure");
                    Item.Validate("Base Unit of Measure", HISUOMMapping."UOM Code");
                    Item.Validate(Type, HisMasterStaging."Inventory-NonInventory");
                    Item.Modify();
                    IF HisMasterStaging."Base Unit of Measure" <> '' then begin
                        ItemUnitofMeasure.INIT();
                        ItemUnitofMeasure."Item No." := Item."No.";
                        ItemUnitofMeasure.Code := Item."Base Unit of Measure";
                        ItemUnitofMeasure."Qty. per Unit of Measure" := 1;
                        IF NOT ItemUnitofMeasure.Insert() then
                            ItemUnitofMeasure.Modify();

                    end;
                    IF HisMasterStaging."Global Dimension 1 Code" <> '' THEN begin
                        GeneralLedgerSetup.Get();
                        DefaultDimension.INIT();
                        DefaultDimension."Table ID" := 27;
                        DefaultDimension."No." := HisMasterStaging."HIS Code";
                        DefaultDimension."Dimension Code" := GeneralLedgerSetup."Global Dimension 1 Code";
                        DefaultDimension."Dimension Value Code" := HisMasterStaging."Global Dimension 1 Code";
                        DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::"Same Code";
                        DefaultDimension.INSERT();
                    end;
                    IF HisMasterStaging."Global Dimension 2 Code" <> '' THEN begin
                        GeneralLedgerSetup.Get();
                        DefaultDimension.INIT();
                        DefaultDimension."Table ID" := 27;
                        DefaultDimension."No." := HisMasterStaging."HIS Code";
                        DefaultDimension."Dimension Code" := GeneralLedgerSetup."Global Dimension 2 Code";
                        DefaultDimension."Dimension Value Code" := HisMasterStaging."Global Dimension 2 Code";
                        DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::"Same Code";
                        DefaultDimension.INSERT();
                    end;
                    HisMasterStaging."Vendor/Customer Code" := Item."No.";
                    HisMasterStaging.IsCreated := TRUE;
                    HisMasterStaging."Modified by" := USERID;
                    HisMasterStaging."Modified Date Time" := CurrentDateTime;
                    HisMasterStaging.MODIFY();
                    MESSAGE('Item has been created Successfully');
                END ELSE
                    HisMasterStaging."Error Description" := 'Check Inventory Posting Group';
                HisMasterStaging.MODIFY();
            //END;
            UNTIL HisMasterStaging.NEXT() = 0
        ELSE
            Error('Kindly Check Error Description');

    END;

    procedure InitGenJnlLineRevenueStaging()
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "3E HIS GL Accounts Mapping";
        intLineNo: Integer;
        MOPLbl: Label 'MOP Setup not found for Mode of payment %1.';
        DocumentTypeLbl: Label 'Setup not found for Document Type %1.';
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Gen. Bus. Posting Group");
        IntegrationSetup.TESTFIELD("Custom Gen. Bus. Posting Group");

        IntegrationSetupLine.Reset();
        IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Revenue);
        IntegrationSetupLine.FindFirst();
        IntegrationSetupLine.TestField("General Journal Template Code");
        IntegrationSetupLine.TestField("General Journal Batch Code");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Revenue Creation Enabled") THEN
            EXIT;


        HISRevenueStaging.RESET();
        HISRevenueStaging.SETFILTER(HISRevenueStaging."General Entries Created", '%1', FALSE);
        HISRevenueStaging.SETFILTER(HISRevenueStaging.Amount, '<>%1', 0);
        HISRevenueStaging.SetFilter("Error Description", '%1', '');
        IF HISRevenueStaging.FINDSET() THEN
            REPEAT
                GenJournalLine.RESET();
                GenJournalLine.SETRANGE("Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.SETRANGE("Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                IF GenJournalLine.FINDLAST() THEN
                    intLineNo := GenJournalLine."Line No."
                ELSE
                    intLineNo := 10000;

                GenJournalLine.INIT();
                GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                intLineNo += 10000;
                GenJournalLine."Line No." := intLineNo;
                GenJournalLine.VALIDATE("Document Type", HISRevenueStaging."Document Type");
                GenJournalLine.VALIDATE("Document No.", HISRevenueStaging."Document No.");
                GenJournalLine.VALIDATE("Posting Date", HISRevenueStaging."Document Date");

                HISGLAccountMapping.Reset();
                HISGLAccountMapping.SetRange(Type, HISGLAccountMapping.Type::MOP);
                HISGLAccountMapping.SetRange("MOP Code", HISRevenueStaging."Mode of Payment");
                if HISGLAccountMapping.FindFirst() then begin

                    GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
                    GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
                end ELSE
                    Error(MOPLbl, HISRevenueStaging."Mode of Payment");

                GenJournalLine.VALIDATE(Amount, HISRevenueStaging.Amount);
                GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                GenJournalLine.VALIDATE("Cheque Date", HISRevenueStaging."Cheque Date");
                GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISRevenueStaging."Cheque No.", 1, 10));
                if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then begin
                    //GenJournalLine.VALIDATE("Location Code", HISRevenueStaging."Shortcut Dimension 1 Code");
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueStaging."Shortcut Dimension 1 Code");
                end;

                if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueStaging."Shortcut Dimension 2 Code"));

                GenJournalLine.VALIDATE("External Document No.", HISRevenueStaging."Cheque No.");
                GenJournalLine."3E Narration" := COPYSTR(HISRevenueStaging."Line Narration", 1, 50);
                GenJournalLine."3E HIS Module" := HISRevenueStaging."HIS Module";
                GenJournalLine."3E HIS Document Type" := COPYSTR(HISRevenueStaging."HIS Document Type", 1, 60);
                GenJournalLine."3E UTR No." := HISRevenueStaging."Cheque No.";
                GenJournalLine."3E Sub Group Code" := HISRevenueStaging."Sub Group";
                GenJournalLine."3E Receipt No." := COPYSTR(HISRevenueStaging."Receipt No.", 1, 20);
                GenJournalLine."3E UHID" := HISRevenueStaging.UHID;
                GenJournalLine."3E Validation Key" := HISRevenueStaging."Validation HIS Key";
                GenJournalLine."3E Store Code" := HISRevenueStaging."Store Code";
                GenJournalLine."3E Patient Name" := HISRevenueStaging."Patient Name";
                GenJournalLine."3E Transaction Type" := HISRevenueStaging.TRANSACTION_TYPE;
                GenJournalLine."3E Encounter No." := HISRevenueStaging."Encounter No.";
                GenJournalLine.INSERT();

                GenJournalLine.INIT();
                GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                intLineNo += 10000;
                GenJournalLine."Line No." := intLineNo;
                GenJournalLine.VALIDATE("Document Type", HISRevenueStaging."Document Type");
                GenJournalLine.VALIDATE("Document No.", HISRevenueStaging."Document No.");
                GenJournalLine.VALIDATE("Posting Date", HISRevenueStaging."Document Date");

                HISGLAccountMapping.Reset();
                HISGLAccountMapping.SetRange("Service/Station Head", HISRevenueStaging."HIS Document Type");
                if HISGLAccountMapping.FindFirst() then begin

                    GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
                    GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
                end ELSE
                    Error(DocumentTypeLbl, HISRevenueStaging."HIS Document Type");

                GenJournalLine.VALIDATE(Amount, -HISRevenueStaging.Amount);
                GenJournalLine.validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                GenJournalLine.VALIDATE("Cheque Date", HISRevenueStaging."Cheque Date");
                GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISRevenueStaging."Cheque No.", 1, 10));
                if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then begin
                    //GenJournalLine.VALIDATE("Location Code", HISRevenueStaging."Shortcut Dimension 1 Code");
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueStaging."Shortcut Dimension 1 Code");
                end;

                if HISRevenueStaging."Shortcut Dimension 1 Code" <> '' then
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueStaging."Shortcut Dimension 2 Code"));

                GenJournalLine.VALIDATE("External Document No.", HISRevenueStaging."External Document No.");
                GenJournalLine."3E Narration" := COPYSTR(HISRevenueStaging."Line Narration", 1, 50);
                GenJournalLine."3E HIS Module" := HISRevenueStaging."HIS Module";
                GenJournalLine."3E HIS Document Type" := COPYSTR(HISRevenueStaging."HIS Document Type", 1, 60);
                GenJournalLine."3E UTR No." := HISRevenueStaging."Cheque No.";
                GenJournalLine."3E Sub Group Code" := HISRevenueStaging."Sub Group";
                GenJournalLine."3E Receipt No." := COPYSTR(HISRevenueStaging."Receipt No.", 1, 20);
                GenJournalLine."3E UHID" := HISRevenueStaging.UHID;
                GenJournalLine."3E Validation Key" := HISRevenueStaging."Validation HIS Key";
                GenJournalLine."3E Store Code" := HISRevenueStaging."Store Code";
                GenJournalLine."3E Patient Name" := HISRevenueStaging."Patient Name";
                GenJournalLine."3E Transaction Type" := HISRevenueStaging.TRANSACTION_TYPE;
                GenJournalLine."3E Encounter No." := HISRevenueStaging."Encounter No.";
                GenJournalLine.INSERT();

                HISRevenueStaging."Created By" := USERID;
                HISRevenueStaging."Created Date Time" := CURRENTDATETIME;
                HISRevenueStaging."General Entries Created" := TRUE;
                HISRevenueStaging.MODIFY();
            UNTIL HISRevenueStaging.NEXT() = 0;

    end;

    procedure InitGenJnlLineSettlementStaging()
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "3E HIS GL Accounts Mapping";
        intLineNo: Integer;
        MOPLbl: Label 'MOP Setup not found for Mode of payment %1.';
        DocumentTypeLbl: Label 'Setup not found for Document Type %1.';
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Gen. Bus. Posting Group");
        IntegrationSetup.TESTFIELD("Custom Gen. Bus. Posting Group");

        IntegrationSetupLine.Reset();
        IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Revenue);
        IntegrationSetupLine.FindFirst();
        IntegrationSetupLine.TestField("General Journal Template Code");
        IntegrationSetupLine.TestField("General Journal Batch Code");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Revenue Creation Enabled") THEN
            EXIT;

        HISSettlementStaging.RESET();
        HISSettlementStaging.SETFILTER(HISSettlementStaging."General Entries Created", '%1', FALSE);
        HISSettlementStaging.SETFILTER(HISSettlementStaging.Amount, '<>%1', 0);
        IF HISSettlementStaging.FINDSET() THEN
            REPEAT
                GenJournalLine.RESET();
                GenJournalLine.SETRANGE("Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.SETRANGE("Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                IF GenJournalLine.FINDLAST() THEN
                    intLineNo := GenJournalLine."Line No."
                ELSE
                    intLineNo := 10000;

                GenJournalLine.INIT();
                GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                intLineNo += 10000;
                GenJournalLine."Line No." := intLineNo;
                GenJournalLine.VALIDATE("Document Type", HISSettlementStaging."Document Type");
                GenJournalLine.VALIDATE("Document No.", HISSettlementStaging."Document No.");
                GenJournalLine.VALIDATE("Posting Date", HISSettlementStaging."Document Date");

                HISGLAccountMapping.Reset();
                HISGLAccountMapping.SetRange(Type, HISGLAccountMapping.Type::Settlement);
                HISGLAccountMapping.SetRange("MOP Code", HISSettlementStaging."HIS Document Type");
                if HISGLAccountMapping.FindFirst() then begin

                    GenJournalLine.VALIDATE("Account Type", HISGLAccountMapping."Account Type");
                    GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."Account No.");
                end ELSE
                    Error(MOPLbl, HISSettlementStaging."HIS Document Type");//ak

                GenJournalLine.VALIDATE(Amount, HISSettlementStaging.Amount);
                GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                GenJournalLine.VALIDATE("Cheque Date", HISSettlementStaging."Cheque Date");
                GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISSettlementStaging."Cheque No.", 1, 10));
                if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then begin
                    //GenJournalLine.VALIDATE("Location Code", HISSettlementStaging."Shortcut Dimension 1 Code");
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISSettlementStaging."Shortcut Dimension 1 Code");
                end;

                if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISSettlementStaging."Shortcut Dimension 2 Code"));

                GenJournalLine.VALIDATE("External Document No.", HISSettlementStaging."External Document No.");
                GenJournalLine."3E Narration" := COPYSTR(HISSettlementStaging."Line Narration", 1, 50);
                GenJournalLine."3E HIS Module" := HISSettlementStaging."HIS Module";
                GenJournalLine."3E HIS Document Type" := COPYSTR(HISSettlementStaging."HIS Document Type", 1, 60);
                GenJournalLine."3E UTR No." := HISSettlementStaging."Cheque No.";
                GenJournalLine."3E Sub Group Code" := HISSettlementStaging."Sub Group";
                GenJournalLine."3E Receipt No." := COPYSTR(HISSettlementStaging."Receipt No.", 1, 20);
                GenJournalLine."3E UHID" := HISSettlementStaging.UHID;
                GenJournalLine."3E Validation Key" := HISSettlementStaging."Validation HIS Key";
                GenJournalLine."3E Store Code" := HISSettlementStaging."Store Code";
                GenJournalLine."3E Patient Name" := HISSettlementStaging."Patient Name";
                GenJournalLine."3E Transaction Type" := HISSettlementStaging.TRANSACTION_TYPE;
                GenJournalLine.INSERT();

                GenJournalLine.INIT();
                GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                intLineNo += 10000;
                GenJournalLine."Line No." := intLineNo;
                GenJournalLine.VALIDATE("Document Type", HISSettlementStaging."Document Type");
                GenJournalLine.VALIDATE("Document No.", HISSettlementStaging."Document No.");
                GenJournalLine.VALIDATE("Posting Date", HISSettlementStaging."Document Date");

                GenJournalLine.VALIDATE(Amount, -HISSettlementStaging.Amount);
                GenJournalLine.validate("Account Type", HISSettlementStaging."Bal. Account Type");
                GenJournalLine.validate("Account No.", HISSettlementStaging."Bal. Account No");
                GenJournalLine.VALIDATE("Cheque Date", HISSettlementStaging."Cheque Date");
                GenJournalLine.VALIDATE("Cheque No.", COPYSTR(HISSettlementStaging."Cheque No.", 1, 10));
                if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then begin
                    //GenJournalLine.VALIDATE("Location Code", HISSettlementStaging."Shortcut Dimension 1 Code");
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISSettlementStaging."Shortcut Dimension 1 Code");
                end;

                if HISSettlementStaging."Shortcut Dimension 1 Code" <> '' then
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISSettlementStaging."Shortcut Dimension 2 Code"));

                GenJournalLine.VALIDATE("External Document No.", HISSettlementStaging."External Document No.");
                GenJournalLine."3E Narration" := COPYSTR(HISSettlementStaging."Line Narration", 1, 50);
                GenJournalLine."3E HIS Module" := HISSettlementStaging."HIS Module";
                GenJournalLine."3E HIS Document Type" := COPYSTR(HISSettlementStaging."HIS Document Type", 1, 60);
                GenJournalLine."3E UTR No." := HISSettlementStaging."Cheque No.";
                GenJournalLine."3E Sub Group Code" := HISSettlementStaging."Sub Group";
                GenJournalLine."3E Receipt No." := COPYSTR(HISSettlementStaging."Receipt No.", 1, 20);
                GenJournalLine."3E UHID" := HISSettlementStaging.UHID;
                GenJournalLine."3E Validation Key" := HISSettlementStaging."Validation HIS Key";
                GenJournalLine."3E Store Code" := HISSettlementStaging."Store Code";
                GenJournalLine."3E Patient Name" := HISSettlementStaging."Patient Name";
                GenJournalLine."3E Transaction Type" := HISSettlementStaging.TRANSACTION_TYPE;
                GenJournalLine.INSERT();

                HISSettlementStaging."Created By" := USERID;
                HISSettlementStaging."Created Date Time" := CURRENTDATETIME;
                HISSettlementStaging."General Entries Created" := TRUE;
                HISSettlementStaging.MODIFY();
            UNTIL HISSettlementStaging.NEXT() = 0;

    end;

    procedure InitGenJnlLineConsumptionEntry()
    var
        GenJournalLine: Record "Gen. Journal Line";
        HISGLAccountMapping: Record "3E HIS Item Mapping";
        HISConsumptionEntry: Record "3E HIS Consumption Entries";
        intLineNo: Integer;
        MOPLbl: Label 'Item Mapping Setup not found for Item Category %1.';
        DocumentTypeLbl: Label 'Setup not found for Entry No. %1.';

    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Vendor Gen. Bus. Posting Group");
        IntegrationSetup.TESTFIELD("Custom Gen. Bus. Posting Group");

        IntegrationSetupLine.Reset();
        IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Consumption);
        IntegrationSetupLine.FindFirst();
        IntegrationSetupLine.TestField("General Journal Template Code");
        IntegrationSetupLine.TestField("General Journal Batch Code");

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Consumption Creation Enabled") THEN
            EXIT;

        HISConsumptionEntry.RESET();
        HISConsumptionEntry.SETFILTER(HISConsumptionEntry."General Entries Created", '%1', FALSE);
        HISConsumptionEntry.SETFILTER(HISConsumptionEntry.Amount, '<>%1', 0);
        //HISConsumptionEntry.SetFilter("Error Description", '%1', '');
        ;
        IF HISConsumptionEntry.FINDSET() THEN
            REPEAT
                GenJournalLine.RESET();
                GenJournalLine.SETRANGE("Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.SETRANGE("Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                IF GenJournalLine.FINDLAST() THEN
                    intLineNo := GenJournalLine."Line No."
                ELSE
                    intLineNo := 1;

                GenJournalLine.INIT();
                GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                intLineNo += 1;
                GenJournalLine."Line No." := intLineNo;
                GenJournalLine.VALIDATE("Document Type", HISConsumptionEntry."Document Type");
                GenJournalLine.VALIDATE("Document No.", HISConsumptionEntry."Document No.");
                GenJournalLine.VALIDATE("Posting Date", HISConsumptionEntry."Posting Date");

                HISGLAccountMapping.Reset();
                HISGLAccountMapping.SetRange("Entry Type", HISGLAccountMapping."Entry Type"::Consumption);
                HISGLAccountMapping.SetRange("Item Category Code", HISConsumptionEntry."Item Category Code");
                if HISGLAccountMapping.FindFirst() then begin
                    GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::"G/L Account");
                    GenJournalLine.VALIDATE("Account No.", HISGLAccountMapping."G/L Account No.");
                end ELSE
                    Error(DocumentTypeLbl, HISConsumptionEntry."Entry No.");

                GenJournalLine.VALIDATE(Amount, HISConsumptionEntry.Amount);
                GenJournalLine.VALIDATE("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                HISGLAccountMapping.Reset();
                HISGLAccountMapping.SetRange("Entry Type", HISGLAccountMapping."Entry Type"::"Purchase Order");
                HISGLAccountMapping.SetRange("Item Category Code", HISConsumptionEntry."Item Category Code");
                if HISGLAccountMapping.FindFirst() then
                    GenJournalLine.VALIDATE("Bal. Account No.", HISGLAccountMapping."G/L Account No.")
                ELSE
                    Error(DocumentTypeLbl, HISRevenueStaging."HIS Document Type");

                if HISConsumptionEntry."Shortcut Dimension 1 Code" <> '' then begin
                    //GenJournalLine.VALIDATE("Location Code", HISConsumptionEntry."Shortcut Dimension 1 Code");
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISConsumptionEntry."Shortcut Dimension 1 Code");
                end;

                if HISConsumptionEntry."Shortcut Dimension 1 Code" <> '' then
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISConsumptionEntry."Shortcut Dimension 2 Code"));

                GenJournalLine.VALIDATE("External Document No.", HISConsumptionEntry."External Document No.");
                GenJournalLine."3E Narration" := COPYSTR(HISConsumptionEntry."Line Narration", 1, 50);
                GenJournalLine."3E HIS Module" := HISConsumptionEntry."HIS Module";
                GenJournalLine."3E HIS Document Type" := COPYSTR(HISConsumptionEntry."HIS Document Type", 1, 60);
                GenJournalLine."3E Sub Group Code" := HISConsumptionEntry."Sub Group";
                GenJournalLine."3E Receipt No." := COPYSTR(HISConsumptionEntry."Receipt No.", 1, 20);
                GenJournalLine."3E UHID" := HISConsumptionEntry.UHID;
                GenJournalLine."3E Validation Key" := HISConsumptionEntry."Validation HIS Key";
                GenJournalLine."3E Store Code" := HISConsumptionEntry."Store Code";
                GenJournalLine."3E Patient Name" := HISConsumptionEntry."Patient Name";
                GenJournalLine."3E Transaction Type" := HISConsumptionEntry.TRANSACTION_TYPE;
                GenJournalLine."3E Speciality" := HISConsumptionEntry.Speciality;
                GenJournalLine.INSERT();

                HISConsumptionEntry."Created By" := USERID;
                HISConsumptionEntry."Created Date Time" := CURRENTDATETIME;
                HISConsumptionEntry."General Entries Created" := TRUE;
                HISConsumptionEntry.MODIFY();
            UNTIL HISConsumptionEntry.NEXT() = 0;

    end;

    procedure InitEmployeeMaster(EntryNo: Integer)
    var
        Employee: Record Employee;
        EmployeePostingGroup: Record "Employee Posting Group";
        Employee1: Record Employee;
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Employee Creation Enabled", TRUE);

        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Employee Creation Enabled") THEN
            EXIT;

        HisMasterStaging.RESET();
        HisMasterStaging.SETRANGE("Entry No.", EntryNo);
        HisMasterStaging.SETRANGE(IsCreated, FALSE);
        HisMasterStaging.SETRANGE("Party Type", HisMasterStaging."Party Type"::Employee);
        HisMasterStaging.SETFILTER("Error Description", '%1', '');
        HisMasterStaging.SETFILTER("HIS Code", '<>%1', '');
        IF HisMasterStaging.FINDSET() THEN
            REPEAT
                HisMasterStaging.TestField("HIS Code");

                Employee1.RESET();
                Employee1.SETRANGE("No.", HisMasterStaging."HIS Code");
                IF NOT Employee1.FINDFIRST() THEN BEGIN
                    EmployeePostingGroup.RESET();
                    EmployeePostingGroup.SETRANGE(Code, HisMasterStaging."Employee Posting Group");
                    IF EmployeePostingGroup.FINDFIRST() THEN BEGIN
                        IF HisMasterStaging."VAT Registration No." <> '' THEN BEGIN
                            Employee1.RESET();
                            Employee1.SETRANGE(Employee1."Phone No.", HisMasterStaging."Phone No.");
                            IF Employee1.FINDFIRST() THEN
                                REPEAT
                                    ERROR('Same Phone No. is already Exist Employee No. %1 & Employee Name %2', Employee1."No.", Employee1.FullName());
                                UNTIL Employee1.NEXT() = 0;
                        END;
                        Employee.INIT();
                        Employee.VALIDATE("No.", HisMasterStaging."HIS Code");
                        Employee.VALIDATE("First Name", HisMasterStaging.Name);
                        Employee."Last Name" := COPYSTR(HisMasterStaging."Name 2", 1, 30);
                        Employee.Address := COPYSTR(HisMasterStaging.Address, 1, 50);
                        Employee."Address 2" := COPYSTR(HisMasterStaging."Address 2", 1, 50);
                        Employee.VALIDATE("Post Code", HisMasterStaging."Post Code");
                        Employee.VALIDATE(City, HisMasterStaging.City);
                        Employee."Phone No." := HisMasterStaging."Phone No.";
                        Employee.INSERT();
                        Employee.VALIDATE("Employee Posting Group", HisMasterStaging."Employee Posting Group");
                        Employee.VALIDATE("Country/Region Code", HisMasterStaging."Country/Region Code");
                        Employee.VALIDATE("Post Code", HisMasterStaging."Post Code");
                        //Employee.VALIDATE(County, HisMasterStaging.County);
                        Employee."Application Method" := HisMasterStaging."Application Method";
                        Employee.MODIFY();
                        HisMasterStaging."Vendor/Customer Code" := Employee."No.";
                        HisMasterStaging.IsCreated := TRUE;
                        HisMasterStaging."Modified by" := UserId;
                        HisMasterStaging."Modified Date Time" := CurrentDateTime;
                        HisMasterStaging.MODIFY();
                        MESSAGE('Employee has been created Successfully');
                    END ELSE BEGIN
                        HisMasterStaging."Error Description" := 'Check Employee Posting Group';
                        MESSAGE('Employee Posting Group not Exists');
                    END;
                    HisMasterStaging.MODIFY();
                END;
            UNTIL HisMasterStaging.NEXT() = 0
        ELSE
            Error('HIS Code is missing.Kindly check Error Desciption');
    end;

    procedure OrderValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        HISItemMapping: Record "3E HIS Item Mapping";
        RecVendor: Record Vendor;
        txtPurchaseAccount: Text[100];
        LineCount: Integer;
        RecItem: Record Item;
    begin
        LineCount := 0;
        txtPurchaseAccount := '';
        IntegrationSetup.get();

        HISPurchaseSaleHeader.RESET();
        HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
        HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
        HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
            HISPurchaseSaleHeader."Error 1" := FALSE;
            HISPurchaseSaleHeader."Error 2" := FALSE;
            HISPurchaseSaleHeader."Error 3" := FALSE;
            HISPurchaseSaleHeader."Error 4" := FALSE;
            HISPurchaseSaleHeader."Error Description" := '';
            HISPurchaseSaleHeader.MODIFY();
        END;

        HISPurchaseSaleLine.RESET();
        HISPurchaseSaleLine.SetRange("Record Type", RecordType);
        HISPurchaseSaleLine.SetRange("Document Type", DocumentType);
        HISPurchaseSaleLine.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleLine.FINDFIRST() THEN BEGIN
            REPEAT
                LineCount += 1;
                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then begin
                    if HISPurchaseSaleLine."Purchase Account" = '' then
                        IF (HISPurchaseSaleLine."Record Type" = HISPurchaseSaleLine."Record Type"::GRN) AND (HISPurchaseSaleLine."Document Type" = HISPurchaseSaleLine."Document Type"::Order) THEN BEGIN
                            HISItemMapping.RESET();
                            HISItemMapping.SETRANGE("eNTRY tYPE", HISItemMapping."Entry Type"::"Purchase Order");
                            HISItemMapping.SETRANGE(HISItemMapping."Item Category Code", HISPurchaseSaleLine."Item Category Code");
                            IF HISItemMapping.FINDFIRST() THEN begin
                                HISPurchaseSaleLine."Purchase Account" := HISItemMapping."G/L Account No.";
                                HISPurchaseSaleLine.MODIFY();
                            end;
                        end else
                            IF (HISPurchaseSaleLine."Record Type" = HISPurchaseSaleLine."Record Type"::"GRN Return") AND (HISPurchaseSaleLine."Document Type" = HISPurchaseSaleLine."Document Type"::"Return Order") THEN begin
                                HISItemMapping.RESET();
                                HISItemMapping.SETRANGE("eNTRY tYPE", HISItemMapping."Entry Type"::"Purchase Return Order");
                                HISItemMapping.SETRANGE(HISItemMapping."Item Category Code", HISPurchaseSaleLine."Item Category Code");
                                IF HISItemMapping.FINDFIRST() THEN begin
                                    HISPurchaseSaleLine."Purchase Account" := HISItemMapping."G/L Account No.";
                                    HISPurchaseSaleLine.MODIFY();
                                end;
                            end;
                end else begin
                    IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then begin
                        if HISPurchaseSaleLine."Item No." <> '' then begin
                            if not RecItem.get(HISPurchaseSaleLine."Item No.") then
                                txtPurchaseAccount := 'Item does not exists';
                        end;
                    end;
                end;

                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then
                    if HISPurchaseSaleLine."Item No." = '' then
                        txtPurchaseAccount := 'Item No. is Missing';

                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then
                    if HISPurchaseSaleLine."Purchase Account" = '' then
                        txtPurchaseAccount := 'Purchase Account is Missing';
            //END;
            UNTIL HISPurchaseSaleLine.NEXT() = 0;

            HISPurchaseSaleHeader.RESET();
            HISPurchaseSaleHeader.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
            HISPurchaseSaleHeader.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
            HISPurchaseSaleHeader.SETRANGE("Document No.", HISPurchaseSaleLine."Document No.");
            IF HISPurchaseSaleHeader.FINDFIRST() THEN begin
                if HISPurchaseSaleHeader."No. of Lines" <> LineCount then
                    HISPurchaseSaleHeader."Error Description" := 'Line Count Mismatch';
                IF (HISPurchaseSaleHeader."Vendor Name" = '') OR (txtPurchaseAccount <> '') THEN
                    HISPurchaseSaleHeader."Error Description" := 'Kindly Check Vendor,HSN Code,GST Group Code'
                ELSE
                    HISPurchaseSaleHeader."Error Description" := '';
                HISPurchaseSaleHeader.MODIFY();
            end;
        END ELSE BEGIN
            HISPurchaseSaleHeader.RESET();
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
                HISPurchaseSaleLine.RESET();
                HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleHeader."Record Type");
                HISPurchaseSaleLine.SetRange("Document Type", HISPurchaseSaleHeader."Document Type");
                HISPurchaseSaleLine.SETRANGE("Document No.", HISPurchaseSaleHeader."Document No.");
                IF NOT HISPurchaseSaleLine.FINDFIRST() THEN
                    HISPurchaseSaleHeader."Error Description" := 'Integration Line is Empty';
                HISPurchaseSaleHeader.MODIFY();
            END;
        END;

        HISPurchaseSaleHeader.RESET();
        HISPurchaseSaleHeader.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
        HISPurchaseSaleHeader.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
        HISPurchaseSaleHeader.SETRANGE("Document No.", HISPurchaseSaleLine."Document No.");
        IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
            if not RecVendor.get(HISPurchaseSaleHeader."Vendor No.") then
                HISRevenueHeader."Error 1" := true;
            IF (HISPurchaseSaleHeader."Vendor Name" = '') THEN
                HISPurchaseSaleHeader."Error 1" := TRUE
            ELSE
                HISPurchaseSaleHeader."Error 1" := FALSE;
            IF (txtPurchaseAccount <> '') THEN
                HISPurchaseSaleHeader."Error 2" := TRUE
            ELSE
                HISPurchaseSaleHeader."Error 2" := FALSE;
            HISPurchaseSaleHeader.MODIFY();
        END;

    end;

    procedure OrderReValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        HISItemMapping: Record "3E HIS Item Mapping";
        txtPurchaseAccount: Text[100];
        LineCount: Integer;
        RecItem: Record Item;
    BEGIN
        LineCount := 0;
        txtPurchaseAccount := '';
        IntegrationSetup.get();

        HISPurchaseSaleHeader.RESET();
        HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
        HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
        HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
            HISPurchaseSaleHeader."Error 1" := FALSE;
            HISPurchaseSaleHeader."Error 2" := FALSE;
            HISPurchaseSaleHeader."Error 3" := FALSE;
            HISPurchaseSaleHeader."Error 4" := FALSE;
            HISPurchaseSaleHeader."Error Description" := '';
            HISPurchaseSaleHeader.MODIFY();
        END;

        HISPurchaseSaleLine.RESET();
        HISPurchaseSaleLine.SetRange("Record Type", RecordType);
        HISPurchaseSaleLine.SetRange("Document Type", DocumentType);
        HISPurchaseSaleLine.SETRANGE("Document No.", DocumentNo);
        IF HISPurchaseSaleLine.FINDFIRST() THEN BEGIN
            REPEAT
                LineCount += 1;
                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then begin
                    if HISPurchaseSaleLine."Purchase Account" = '' then
                        IF (HISPurchaseSaleLine."Record Type" = HISPurchaseSaleLine."Record Type"::GRN) AND (HISPurchaseSaleLine."Document Type" = HISPurchaseSaleLine."Document Type"::Order) THEN BEGIN
                            HISItemMapping.RESET();
                            HISItemMapping.SETRANGE("eNTRY tYPE", HISItemMapping."Entry Type"::"Purchase Order");
                            HISItemMapping.SETRANGE(HISItemMapping."Item Category Code", HISPurchaseSaleLine."Item Category Code");
                            IF HISItemMapping.FINDFIRST() THEN begin
                                HISPurchaseSaleLine."Purchase Account" := HISItemMapping."G/L Account No.";
                                HISPurchaseSaleLine.MODIFY();
                            end;
                        end else
                            IF (HISPurchaseSaleLine."Record Type" = HISPurchaseSaleLine."Record Type"::"GRN Return") AND (HISPurchaseSaleLine."Document Type" = HISPurchaseSaleLine."Document Type"::"Return Order") THEN begin
                                HISItemMapping.RESET();
                                HISItemMapping.SETRANGE("eNTRY tYPE", HISItemMapping."Entry Type"::"Purchase Return Order");
                                HISItemMapping.SETRANGE(HISItemMapping."Item Category Code", HISPurchaseSaleLine."Item Category Code");
                                IF HISItemMapping.FINDFIRST() THEN begin
                                    HISPurchaseSaleLine."Purchase Account" := HISItemMapping."G/L Account No.";
                                    HISPurchaseSaleLine.MODIFY();
                                end;
                            end;
                end else begin
                    IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then begin
                        if HISPurchaseSaleLine."Item No." <> '' then begin
                            if not RecItem.get(HISPurchaseSaleLine."Item No.") then
                                txtPurchaseAccount := 'Item does not exists';
                        end;
                    end;
                end;

                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then
                    if HISPurchaseSaleLine."Item No." = '' then
                        txtPurchaseAccount := 'Item No. is Missing';

                IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then
                    if HISPurchaseSaleLine."Purchase Account" = '' then
                        txtPurchaseAccount := 'Purchase Account is Missing';
            UNTIL HISPurchaseSaleLine.NEXT() = 0;

            HISPurchaseSaleHeader.RESET();
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST() THEN begin
                if HISPurchaseSaleHeader."No. of Lines" <> LineCount then
                    HISPurchaseSaleHeader."Error Description" := 'Line Count Mismatch';

                IF HISPurchaseSaleHeader."Vendor Name" <> '' THEN
                    HISPurchaseSaleHeader."Error 1" := FALSE;

                IF HISPurchaseSaleHeader.Type = HISPurchaseSaleHeader.Type::Vendor then begin
                    Vendor.Reset();
                    Vendor.SetRange("No.", HISPurchaseSaleHeader."Vendor No.");
                    if Vendor.FindFirst() then begin
                        HISPurchaseSaleHeader."Vendor Name" := Vendor.Name;
                        HISPurchaseSaleHeader.Modify();
                    end else begin
                        HISPurchaseSaleHeader."Error 1" := true;
                        HISPurchaseSaleHeader.Modify();
                    end;
                end;

                IF (HISPurchaseSaleHeader."Vendor Name" = '') THEN
                    HISPurchaseSaleHeader."Error Description" := 'Revalidation Error found'
                ELSE
                    HISPurchaseSaleHeader."Error Description" := '';

                IF txtPurchaseAccount = '' THEN
                    HISPurchaseSaleHeader."Error 2" := FALSE;
                HISPurchaseSaleHeader.MODIFY();
            end;
        END ELSE BEGIN
            HISPurchaseSaleHeader.RESET();
            HISPurchaseSaleHeader.SetRange("Record Type", RecordType);
            HISPurchaseSaleHeader.SetRange("Document Type", DocumentType);
            HISPurchaseSaleHeader.SETRANGE("Document No.", DocumentNo);
            IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
                HISPurchaseSaleLine.RESET();
                HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleLine."Record Type");
                HISPurchaseSaleLine.SetRange("Document Type", HISPurchaseSaleLine."Document Type");
                HISPurchaseSaleLine.SETRANGE("Document No.", HISPurchaseSaleHeader."Document No.");
                IF NOT HISPurchaseSaleLine.FINDFIRST() THEN
                    HISPurchaseSaleHeader."Error Description" := 'Integration Line is Empty';
                HISPurchaseSaleHeader.MODIFY();
            END;
        END;

    END;

    procedure InitPurchaseOrder(RecordType: Option; DocumentType: Option; DocumentNo: CODE[20])
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        PostPuch: Codeunit "Purch.-Post";
        LineNo: Integer;
    begin

        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("GRN Item Wise/ Account Wise");
        IntegrationSetup.TESTFIELD("GRN Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."GRN Creation Enabled") THEN
            EXIT;

        OrderValidation(RecordType, documentType, DocumentNo);

        HISPurchaseSaleHeader.RESET();
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Document No.", DocumentNo);
        HISPurchaseSaleHeader.SETRANGE("rECORD tYPE", RecordType);
        HISPurchaseSaleHeader.SETRANGE("Document Type", DocumentType);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Create PO", FALSE);
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Vendor No.", '<>%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."Error Description", '%1', '');
        HISPurchaseSaleHeader.SETFILTER(HISPurchaseSaleHeader."No. of Lines", '<>%1', 0);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 1", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 2", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 3", FALSE);
        HISPurchaseSaleHeader.SETRANGE(HISPurchaseSaleHeader."Error 4", FALSE);
        IF HISPurchaseSaleHeader.FINDFIRST() THEN BEGIN
            PurchHeader.INIT();
            IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::GRN) AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::Order) THEN BEGIN
                if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Invoices" then
                    PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice
                else
                    PurchHeader."Document Type" := PurchHeader."Document Type"::"Order"
            END ELSE
                IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::"GRN Return") AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::"Return Order") THEN
                    if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Invoices" then
                        PurchHeader."Document Type" := PurchHeader."Document Type"::"Credit Memo"
                    else
                        PurchHeader."Document Type" := PurchHeader."Document Type"::"Return Order";

            PurchHeader."No." := HISPurchaseSaleHeader."Document No.";
            PurchHeader.SetHideValidationDialog(true);
            PurchHeader.INSERT(TRUE);
            PurchHeader.VALIDATE("Buy-from Vendor No.", HISPurchaseSaleHeader."Vendor No.");
            if HISPurchaseSaleHeader."Address Code" <> '' then
                PurchHeader.Validate("Order Address Code", HISPurchaseSaleHeader."Address Code");
            PurchHeader.VALIDATE("Order Date", HISPurchaseSaleHeader."Document Date");
            PurchHeader.VALIDATE("Posting Date", HISPurchaseSaleHeader."Posting Date");
            if PurchHeader."Document Type" in [PurchHeader."Document Type"::Order, PurchHeader."Document Type"::Invoice] then
                PurchHeader.VALIDATE("Vendor Invoice No.", HISPurchaseSaleHeader."Vendor Invoice No.")
            else
                PurchHeader."Vendor Cr. Memo No." := HISPurchaseSaleHeader."Vendor Invoice No.";
            PurchHeader.VALIDATE("Location Code", HISPurchaseSaleHeader."Location Code");
            PurchHeader.VALIDATE(PurchHeader."Shortcut Dimension 1 Code", HISPurchaseSaleHeader."Shortcut Dimension 1 Code");
            PurchHeader.VALIDATE(PurchHeader."Vendor Order No.", HISPurchaseSaleHeader."Purchase Order No.");
            PurchHeader.VALIDATE("Posting No. Series", '');
            PurchHeader.VALIDATE("Posting No.", HISPurchaseSaleHeader."Document No.");
            //PurchHeader.Validate("Reference Invoice No.", HISPurchaseSaleHeader."Reference Invoice No.");
            PurchHeader.Validate("3E Capex Type", HISPurchaseSaleHeader."Capex Type");
            //PurchHeader."3E Work Order Type" := HISPurchaseSaleHeader."3E Work Order Type";
            PurchHeader."Responsibility Center" := HISPurchaseSaleHeader."Shortcut Dimension 1 Code";
            PurchHeader."Store Name" := HISPurchaseSaleHeader."Store Name";
            PurchHeader.MODIFY();
            LineNo := 0;

            HISPurchaseSaleLine.RESET();
            HISPurchaseSaleLine.SetRange("Record Type", HISPurchaseSaleHeader."Record Type");
            HISPurchaseSaleLine.SetRange("document Type", HISPurchaseSaleHeader."document Type");
            HISPurchaseSaleLine.SETRANGE(HISPurchaseSaleLine."Document No.", PurchHeader."No.");
            IF HISPurchaseSaleLine.FINDFIRST() THEN
                REPEAT
                    LineNo += 10000;
                    PurchLine.INIT();
                    PurchLine.VALIDATE("Document Type", PurchHeader."Document Type");
                    PurchLine."Document No." := PurchHeader."No.";
                    PurchLine.VALIDATE("Line No.", LineNo);
                    PurchLine.VALIDATE(Type, HISPurchaseSaleLine."Item Type");
                    IntegrationSetup.Get();
                    IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::"G/L Account" then
                        PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Purchase Account")
                    else
                        IF IntegrationSetup."GRN Item Wise/ Account Wise" = IntegrationSetup."GRN Item Wise/ Account Wise"::Item then
                            PurchLine.VALIDATE("No.", HISPurchaseSaleLine."Item No.");

                    IF HISPurchaseSaleLine."Received QTY" <> 0 THEN
                        PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Received QTY")
                    ELSE
                        PurchLine.VALIDATE(Quantity, HISPurchaseSaleLine."Free QTY");
                    PurchLine.VALIDATE("Location Code", PurchHeader."Location Code");
                    PurchLine.VALIDATE("Direct Unit Cost", HISPurchaseSaleLine."Unit Cost");
                    PurchLine.VALIDATE(PurchLine."Shortcut Dimension 1 Code", PurchHeader."Shortcut Dimension 1 Code");
                    //PurchLine.VALIDATE(PurchLine."Shortcut Dimension 2 Code", PurchHeader."Shortcut Dimension 2 Code");
                    PurchLine.Description := COPYSTR(HISPurchaseSaleLine."Item Name", 1, 100);
                    PurchLine.VALIDATE("Line Discount Amount", HISPurchaseSaleLine.Discount);
                    PurchLine."Vendor Item No." := HISPurchaseSaleLine."Item No.";

                    PurchLine.INSERT(TRUE);
                UNTIL HISPurchaseSaleLine.NEXT() = 0;

            HISPurchaseSaleHeader."Create PO" := TRUE;
            HISPurchaseSaleHeader.MODIFY();

            if IntegrationSetup."GRN/GRN Return Handling" = IntegrationSetup."GRN/GRN Return Handling"::"Via Orders" then begin
                Clear(PostPuch);
                IF (HISPurchaseSaleHeader."Record Type" = HISPurchaseSaleHeader."Record Type"::GRN) AND (HISPurchaseSaleHeader."Document Type" = HISPurchaseSaleHeader."Document Type"::Order) THEN BEGIN
                    PurchHeader.Receive := true;
                    PurchHeader.Invoice := false;
                end else begin
                    PurchHeader.Ship := true;
                    PurchHeader.Invoice := false;
                end;

                PurchHeader.Modify(true);
                Commit();
                PostPuch.Run(PurchHeader);
            end;
        END;
    end;

    procedure RevenueInvoiceValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        RevenueSetup: Record "3E HIS GL Accounts Mapping";
        HISItemMapping: Record "3E HIS Item Mapping";
        HISCustMapping: Record "3E HIS Customer Mapping";
        Customer: Record Customer;
        txtSalesAccount: Text[100];
        LineCount: Integer;
    begin
        LineCount := 0;
        txtSalesAccount := '';
        IntegrationSetup.Get();

        HISRevenueHeader.RESET();
        HISRevenueHeader.SetRange("Record Type", RecordType);
        HISRevenueHeader.SetRange("Document Type", DocumentType);
        HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
        IF HISRevenueHeader.FINDFIRST() THEN BEGIN
            HISRevenueHeader."Error 1" := FALSE;
            HISRevenueHeader."Error 2" := FALSE;
            HISRevenueHeader."Error 3" := FALSE;
            HISRevenueHeader."Error 4" := FALSE;
            HISRevenueHeader."Error Description" := '';
            HISRevenueHeader.MODIFY();
        END;

        HISRevenueLine.RESET();
        HISRevenueLine.SetRange("Record Type", RecordType);
        HISRevenueLine.SetRange("Document Type", DocumentType);
        HISRevenueLine.SETRANGE("Document No.", DocumentNo);
        HISRevenueLine.SetRange("Package Patient", false);  //Check if not required
        IF HISRevenueLine.FINDFIRST() THEN BEGIN
            REPEAT
                LineCount += 1;
                //END;
                //End;

                IF HISRevenueLine."Account No." = '' THEN begin
                    HISRevenueHeader.RESET();
                    HISRevenueHeader.SetRange("Record Type", HISRevenueLine."Record Type");
                    HISRevenueHeader.SetRange("Document Type", HISRevenueLine."Document Type");
                    HISRevenueHeader.SETRANGE("Document No.", HISRevenueLine."Document No.");
                    IF HISRevenueHeader.FINDFIRST() THEN begin
                        RevenueSetup.Reset();
                        RevenueSetup.SetRange("Service/Station Head", HISRevenueHeader."HIS Document Type");
                        RevenueSetup.SetRange("HIS Code", HISRevenueLine."Service Item Code");
                        RevenueSetup.SetRange(Package, HISRevenueLine."Package Patient");
                        if not RevenueSetup.FindFirst() then
                            txtSalesAccount := 'Revenue Account Missing'
                        else
                            if (RevenueSetup."Account No." <> '') and (RevenueSetup."Discount G/L Account" <> '') and (RevenueSetup."MOU Discount G/L Account" <> '') then begin
                                HISRevenueLine."Account Type" := RevenueSetup."Account Type";
                                HISRevenueLine."Account No." := RevenueSetup."Account No.";
                                HISRevenueLine."Discount G/L Account" := RevenueSetup."Discount G/L Account";
                                HISRevenueLine."MOU Discount G/L Account" := RevenueSetup."MOU Discount G/L Account";
                                if HISRevenueLine."Shortcut Dimension 1 Code" = '' then
                                    HISRevenueLine."Shortcut Dimension 1 Code" := HISRevenueHeader."Shortcut Dimension 1 Code";
                                HISRevenueLine.Modify(false);
                            end else
                                txtSalesAccount := 'Revenue or Discounts Account Missing';
                    end;
                end;


            UNTIL HISRevenueLine.NEXT() = 0;

            HISRevenueHeader.RESET();
            HISRevenueHeader.SetRange("Record Type", HISRevenueLine."Record Type");
            HISRevenueHeader.SetRange("Document Type", HISRevenueLine."Document Type");
            HISRevenueHeader.SETRANGE("Document No.", HISRevenueLine."Document No.");
            IF HISRevenueHeader.FINDFIRST() THEN begin
                if HISRevenueHeader."No. of Lines" <> LineCount then
                    HISRevenueHeader."Error Description" := 'Line count mismatch.';

                if HISRevenueHeader."Posting Date" = 0D then
                    HISRevenueHeader."Posting Date" := HISRevenueHeader."Document Date";

                if HISRevenueHeader."Location Code" = '' then
                    HISRevenueHeader."Location Code" := HISRevenueHeader."Shortcut Dimension 1 Code";

                if HISRevenueHeader."Customer No." = '' then begin
                    HISCustMapping.Reset();
                    HISCustMapping.SetRange("HIS Code", HISRevenueHeader."Payer Code");
                    if HISCustMapping.FindFirst() then begin
                        Customer.Reset();
                        Customer.SetRange("No.", HISCustMapping."Customer No.");
                        if Customer.FindFirst() then begin
                            HISRevenueHeader."Customer No." := Customer."No.";
                            HISRevenueHeader."Customer Name" := Customer.Name;
                            HISRevenueHeader.Modify();
                        end else
                            HISRevenueHeader."Error Description" := 'Customer does not exists.';
                    end else
                        HISRevenueHeader."Error Description" := 'Customer Mapping Missing';
                end;

                IF (HISRevenueHeader."Customer Name" = '') THEN
                    HISRevenueHeader."Error Description" := 'Kindly Check Customer,HSN Code,GST Group Code';
                // ELSE
                //     HISRevenueHeader."Error Description" := '';

                HISRevenueHeader.MODIFY();
            end;
        END ELSE BEGIN
            HISRevenueHeader.RESET();
            HISRevenueHeader.SetRange("Record Type", RecordType);
            HISRevenueHeader.SetRange("Document Type", DocumentType);
            HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
            IF HISRevenueHeader.FINDFIRST() THEN BEGIN
                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueHeader."Record Type");
                HISRevenueLine.SetRange("Document Type", HISRevenueHeader."Document Type");
                HISRevenueLine.SETRANGE("Document No.", HISRevenueHeader."Document No.");
                IF NOT HISRevenueLine.FINDFIRST() THEN
                    HISRevenueHeader."Error Description" := 'Integration Line is Empty';
                HISRevenueHeader.MODIFY();
            END;
        END;

        HISRevenueHeader.RESET();
        HISRevenueHeader.SetRange("Record Type", HISRevenueLine."Record Type");
        HISRevenueHeader.SetRange("Document Type", HISRevenueLine."Document Type");
        HISRevenueHeader.SETRANGE("Document No.", HISRevenueLine."Document No.");
        IF HISRevenueHeader.FINDFIRST() THEN BEGIN
            IF (HISRevenueHeader."Customer Name" = '') THEN
                HISRevenueHeader."Error 1" := TRUE
            ELSE
                HISRevenueHeader."Error 1" := FALSE;
            IF (txtSalesAccount <> '') THEN
                HISRevenueHeader."Error 2" := TRUE
            ELSE
                HISRevenueHeader."Error 4" := FALSE;
            HISRevenueHeader.MODIFY();
        END;
        Commit();
    end;

    procedure RevenueInvoiceReValidation(RecordType: option; DocumentType: Option; DocumentNo: Code[20])
    var
        RevenueSetup: Record "3E HIS GL Accounts Mapping";
        HISItemMapping: Record "3E HIS Item Mapping";
        HISCustMapping: Record "3E HIS Customer Mapping";
        txtSalesAccount: Text[100];
        Customer: Record Customer;
        LineCount: Integer;
    BEGIN
        LineCount := 0;
        txtSalesAccount := '';
        IntegrationSetup.Get();

        HISRevenueHeader.RESET();
        HISRevenueHeader.SetRange("Record Type", RecordType);
        HISRevenueHeader.SetRange("Document Type", DocumentType);
        HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
        IF HISRevenueHeader.FINDFIRST() THEN BEGIN
            HISRevenueHeader."Error 1" := FALSE;
            HISRevenueHeader."Error 2" := FALSE;
            HISRevenueHeader."Error 3" := FALSE;
            HISRevenueHeader."Error 4" := FALSE;
            HISRevenueHeader."Error Description" := '';
            HISRevenueHeader.MODIFY();
        END;

        HISRevenueLine.RESET();
        HISRevenueLine.SetRange("Record Type", RecordType);
        HISRevenueLine.SetRange("Document Type", DocumentType);
        HISRevenueLine.SETRANGE("Document No.", DocumentNo);
        HISRevenueLine.SetRange("Package Patient", false);  //Check if exceluded
        IF HISRevenueLine.FINDFIRST() THEN BEGIN
            REPEAT
                LineCount += 1;
                //END;
                //End;

                IF HISRevenueLine."Account No." = '' THEN BEGIN
                    HISRevenueHeader.RESET();
                    HISRevenueHeader.SetRange("Record Type", RecordType);
                    HISRevenueHeader.SetRange("Document Type", DocumentType);
                    HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
                    IF HISRevenueHeader.FINDFIRST() THEN begin
                        RevenueSetup.Reset();
                        RevenueSetup.SetRange("Service/Station Head", HISRevenueHeader."HIS Document Type");
                        RevenueSetup.SetRange("HIS Code", HISRevenueLine."Service Item Code");
                        RevenueSetup.SetRange(Package, HISRevenueLine."Package Patient");
                        if not RevenueSetup.FindFirst() then
                            txtSalesAccount := 'Revenue Account Missing'
                        else
                            if (RevenueSetup."Account No." <> '') and (RevenueSetup."Discount G/L Account" <> '') and (RevenueSetup."MOU Discount G/L Account" <> '') then begin
                                HISRevenueLine."Account Type" := RevenueSetup."Account Type";
                                HISRevenueLine."Account No." := RevenueSetup."Account No.";
                                HISRevenueLine."Discount G/L Account" := RevenueSetup."Discount G/L Account";
                                HISRevenueLine."MOU Discount G/L Account" := RevenueSetup."MOU Discount G/L Account";
                                if HISRevenueLine."Shortcut Dimension 1 Code" = '' then
                                    HISRevenueLine."Shortcut Dimension 1 Code" := HISRevenueHeader."Shortcut Dimension 1 Code";
                                HISRevenueLine.Modify(false);
                            end else
                                txtSalesAccount := 'Revenue or Discounts Account Missing';
                    END;
                end;
            UNTIL HISRevenueLine.NEXT() = 0;

            HISRevenueHeader.RESET();
            HISRevenueHeader.SetRange("Record Type", RecordType);
            HISRevenueHeader.SetRange("Document Type", DocumentType);
            HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
            IF HISRevenueHeader.FINDFIRST() THEN begin
                if HISRevenueHeader."No. of Lines" <> LineCount then
                    HISRevenueHeader."Error Description" := 'Line count mismatch.';

                if HISRevenueHeader."Posting Date" = 0D then
                    HISRevenueHeader."Posting Date" := HISRevenueHeader."Document Date";

                if HISRevenueHeader."Location Code" = '' then
                    HISRevenueHeader."Location Code" := HISRevenueHeader."Shortcut Dimension 1 Code";

                if HISRevenueHeader."Customer No." = '' then begin
                    HISCustMapping.Reset();
                    HISCustMapping.SetRange("HIS Code", HISRevenueHeader."Payer Code");
                    if HISCustMapping.FindFirst() then begin
                        Customer.Reset();
                        Customer.SetRange("No.", HISCustMapping."Customer No.");
                        if Customer.FindFirst() then begin
                            HISRevenueHeader."Customer No." := Customer."No.";
                            HISRevenueHeader."Customer Name" := Customer.Name;
                            HISRevenueHeader.Modify();
                        end else
                            HISRevenueHeader."Error Description" := 'Customer does not exists.';
                    end else
                        HISRevenueHeader."Error Description" := 'Customer Mapping Missing';
                end else begin
                    Customer.Reset();
                    Customer.SetRange("No.", HISRevenueHeader."Customer No.");
                    if Customer.FindFirst() then begin
                        HISRevenueHeader."Customer Name" := Customer.Name;
                        HISRevenueHeader.Modify();
                    end;
                end;

                IF (HISRevenueHeader."Customer Name" = '') OR (txtSalesAccount <> '') THEN
                    HISRevenueHeader."Error Description" := 'Revalidation Error found';
                // ELSE
                //     HISRevenueHeader."Error Description" := '';

                IF HISRevenueHeader."Customer Name" <> '' THEN BEGIN
                    HISRevenueHeader."Error 1" := FALSE
                END;

                IF txtSalesAccount = '' THEN
                    HISRevenueHeader."Error 2" := FALSE;
                HISRevenueHeader.MODIFY();
            end;
        END ELSE BEGIN
            HISRevenueHeader.RESET();
            HISRevenueHeader.SetRange("Record Type", RecordType);
            HISRevenueHeader.SetRange("Document Type", DocumentType);
            HISRevenueHeader.SETRANGE("Document No.", DocumentNo);
            IF HISRevenueHeader.FINDFIRST() THEN BEGIN
                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueLine."Record Type");
                HISRevenueLine.SetRange("Document Type", HISRevenueLine."Document Type");
                HISRevenueLine.SETRANGE("Document No.", HISRevenueHeader."Document No.");
                IF NOT HISRevenueLine.FINDFIRST() THEN
                    HISRevenueHeader."Error Description" := 'Integration Line is Empty';
                HISRevenueHeader.MODIFY();
            END;
        END;
        Commit();
    END;

    procedure InitRevenueInvoice(RecordType: Option; DocumentType: Option; DocumentNo: CODE[20])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        GenJournalLine: Record "Gen. Journal Line";
        InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary;
        PostGenJnlLine: Codeunit "Gen. Jnl.-Post Line";
        AmountToCustomer: Decimal;
        PatientPayble: Decimal;
        LineNo: Integer;
    begin
        AmountToCustomer := 0;
        PatientPayble := 0;
        IntegrationSetup.GET();
        //IntegrationSetup.testfield("Account Type");
        IntegrationSetup.testfield("Account No.");

        RevenueInvoiceValidation(RecordType, documentType, DocumentNo);

        HISRevenueHeader.RESET();
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Document No.", DocumentNo);
        HISRevenueHeader.SETRANGE("Record Type", RecordType);
        HISRevenueHeader.SETRANGE("Document Type", DocumentType);
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Create Revenue", FALSE);
        HISRevenueHeader.SETFILTER(HISRevenueHeader."Customer No.", '<>%1', '');
        HISRevenueHeader.SETFILTER(HISRevenueHeader."Error Description", '%1', '');
        HISRevenueHeader.SETFILTER(HISRevenueHeader."No. of Lines", '<>%1', 0);
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Error 1", FALSE);
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Error 2", FALSE);
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Error 3", FALSE);
        HISRevenueHeader.SETRANGE(HISRevenueHeader."Error 4", FALSE);
        IF HISRevenueHeader.FINDFIRST() THEN BEGIN
            if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then begin
                SalesHeader.INIT();
                IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN BEGIN
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice
                END ELSE
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                        SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";

                SalesHeader."No." := HISRevenueHeader."Document No.";
                SalesHeader.INSERT(TRUE);
                SalesHeader.VALIDATE("Sell-to Customer No.", HISRevenueHeader."Customer No.");
                SalesHeader.VALIDATE("Order Date", HISRevenueHeader."Document Date");
                if HISRevenueHeader."Posting Date" <> 0D then
                    SalesHeader.VALIDATE("Posting Date", HISRevenueHeader."Posting Date")
                else
                    SalesHeader.Validate("Posting Date", HISRevenueHeader."Document Date");
                SalesHeader.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");
                if HISRevenueHeader."Location Code" <> '' then
                    SalesHeader.VALIDATE("Location Code", HISRevenueHeader."Location Code")
                else
                    SalesHeader.Validate("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));
                SalesHeader.VALIDATE("Posting No. Series", '');
                SalesHeader.VALIDATE("Posting No.", HISRevenueHeader."Document No.");
                //SalesHeader.Validate("Reference Invoice No.", HISRevenueHeader."Reference Invoice No.");
                SalesHeader."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                SalesHeader."3E UHID" := HISRevenueHeader."UHID";
                SalesHeader."3E Patient Name" := HISRevenueHeader."Patient Name";
                SalesHeader."3E Encounter No." := HISRevenueHeader."Encounter No.";
                SalesHeader."3E Doctor Name" := HISRevenueHeader.Doctor;
                SalesHeader."3E Speciality" := HISRevenueHeader."Speciality";
                SalesHeader."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                SalesHeader."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                SalesHeader."3E Payer Code" := HISRevenueHeader."Payer Code";
                SalesHeader."3E Payer Name" := HISRevenueHeader."Payer Name";
                SalesHeader.MODIFY();
            end else begin
                IntegrationSetupLine.Reset();
                IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Revenue);
                IntegrationSetupLine.FindFirst();
                IntegrationSetupLine.TestField("General Journal Template Code");
                IntegrationSetupLine.TestField("General Journal Batch Code");
            end;

            LineNo := 0;
            if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then begin
                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueHeader."Record Type");
                HISRevenueLine.SetRange("document Type", HISRevenueHeader."document Type");
                HISRevenueLine.SETRANGE(HISRevenueLine."Document No.", SalesHeader."No.");
                HISRevenueLine.SetRange("Package Patient", false);
                IF HISRevenueLine.FINDFIRST() THEN
                    REPEAT
                        LineNo += 10000;
                        SalesLine.INIT();
                        SalesLine.VALIDATE("Document Type", SalesHeader."Document Type");
                        SalesLine."Document No." := SalesHeader."No.";
                        SalesLine.VALIDATE("Line No.", LineNo);
                        SalesLine.VALIDATE(Type, SalesLine.Type::"G/L Account");
                        SalesLine.VALIDATE("No.", HISRevenueLine."Account No.");
                        SalesLine.VALIDATE(Quantity, HISRevenueLine.Qty);
                        SalesLine.VALIDATE(SalesLine."Unit Price", HISRevenueLine.Amount);
                        SalesLine.VALIDATE("Location Code", SalesHeader."Location Code");
                        SalesLine.VALIDATE(SalesLine."Shortcut Dimension 1 Code", SalesHeader."Shortcut Dimension 1 Code");
                        SalesLine.VALIDATE(SalesLine."Shortcut Dimension 2 Code", SalesHeader."Shortcut Dimension 2 Code");
                        SalesLine.Description := COPYSTR(HISRevenueLine."Item Name", 1, 100);
                        SalesLine.VALIDATE("Line Discount Amount", -1 * HISRevenueLine.Discount);
                        SalesLine.INSERT(TRUE);
                    UNTIL HISRevenueLine.NEXT() = 0;
            end else begin
                InvoicePostingBuffer.DeleteAll();
                AmountToCustomer := 0;
                PatientPayble := 0;

                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueHeader."Record Type");
                HISRevenueLine.SetRange("document Type", HISRevenueHeader."document Type");
                HISRevenueLine.SETRANGE(HISRevenueLine."Document No.", HISRevenueHeader."Document No.");
                HISRevenueLine.SetRange("Package Patient", false);
                IF HISRevenueLine.FINDFIRST() THEN
                    REPEAT
                        AmountToCustomer += HISRevenueHeader."Payor Payable"; //ak
                        PatientPayble += HISRevenueHeader."Patient Payable"; //ak

                        InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."Account No.");
                        InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                        InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                        if InvoicePostingBuffer.FindFirst() then begin
                            InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-(HISRevenueLine.Amount));
                            InvoicePostingBuffer.Modify();
                        end else begin
                            InvoicePostingBuffer.Init();
                            InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code";
                            InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                            InvoicePostingBuffer."G/L Account" := HISRevenueLine."Account No.";
                            InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                            InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                            InvoicePostingBuffer.Amount := -(HISRevenueLine.Amount);
                            InvoicePostingBuffer.Insert();
                        end;

                        if HISRevenueLine.Discount <> 0 then begin
                            //AmountToCustomer += HISRevenueLine.Discount;
                            InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."Discount G/L Account");
                            InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                            InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                            if InvoicePostingBuffer.FindFirst() then begin
                                InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-HISRevenueLine.Discount);
                                InvoicePostingBuffer.Modify();
                            end else begin
                                InvoicePostingBuffer.Init();
                                InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code" + ';Discount';
                                InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                                InvoicePostingBuffer."G/L Account" := HISRevenueLine."Discount G/L Account";
                                InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                                InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                                InvoicePostingBuffer.Amount := -HISRevenueLine.Discount;
                                InvoicePostingBuffer.Insert();
                            end;
                        end;

                        if HISRevenueLine."MOU Discount" <> 0 then begin
                            //AmountToCustomer += HISRevenueLine.Discount;
                            InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."MOU Discount G/L Account");
                            InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                            InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                            if InvoicePostingBuffer.FindFirst() then begin
                                InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-HISRevenueLine."MOU Discount");
                                InvoicePostingBuffer.Modify();
                            end else begin
                                InvoicePostingBuffer.Init();
                                InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code" + ';MOUDiscount';
                                InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                                InvoicePostingBuffer."G/L Account" := HISRevenueLine."MOU Discount G/L Account";
                                InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                                InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                                InvoicePostingBuffer.Amount := -HISRevenueLine."MOU Discount";
                                InvoicePostingBuffer.Insert();
                            end;
                        end;
                    UNTIL HISRevenueLine.NEXT() = 0;

                GenJournalLine.Reset();
                GenJournalLine.SetRange("Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.SetRange("Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                if GenJournalLine.FindLast() then
                    LineNo := GenJournalLine."Line No."
                else
                    LineNo := 0;

                InvoicePostingBuffer.Reset();
                InvoicePostingBuffer.SetFilter(Amount, '<>0');
                if InvoicePostingBuffer.FindSet() then
                    repeat
                        LineNo += 10000;
                        GenJournalLine.INIT();
                        GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                        GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                        GenJournalLine."Line No." := LineNo;
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                        ELSE
                            IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                                GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                        GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                        GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                        GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date");
                        GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::"G/L Account");
                        GenJournalLine.VALIDATE("Account No.", InvoicePostingBuffer."G/L Account");
                        //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                        GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                            GenJournalLine.VALIDATE(Amount, InvoicePostingBuffer.Amount)
                        else
                            GenJournalLine.VALIDATE(Amount, -InvoicePostingBuffer.Amount);
                        if InvoicePostingBuffer."Global Dimension 1 Code" <> '' then begin
                            //GenJournalLine.VALIDATE("Location Code", InvoicePostingBuffer."Global Dimension 1 Code");
                            GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", InvoicePostingBuffer."Global Dimension 1 Code");
                        end;

                        if InvoicePostingBuffer."Global Dimension 2 Code" <> '' then
                            GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(InvoicePostingBuffer."Global Dimension 2 Code"));

                        GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                        GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                        GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                        GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                        GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                        GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                        GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                        GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                        GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                        GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                        GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                        if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                            PostGenJnlLine.RunWithCheck(GenJournalLine)
                        else
                            GenJournalLine.INSERT();
                    until InvoicePostingBuffer.Next() = 0;

                if PatientPayble <> 0 then begin
                    LineNo += 10000;
                    GenJournalLine.INIT();
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                    GenJournalLine."Line No." := LineNo;
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                    ELSE
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                    GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                    GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                    GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date");
                    GenJournalLine.VALIDATE("Account Type", IntegrationSetup."Account Type");
                    GenJournalLine.VALIDATE("Account No.", IntegrationSetup."Account No.");
                    //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                    GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE(Amount, PatientPayble)
                    else
                        GenJournalLine.Validate(Amount, -PatientPayble);
                    if HISRevenueHeader."Shortcut Dimension 1 Code" <> '' then begin
                        //GenJournalLine.VALIDATE("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                    end;

                    if HISRevenueHeader."Shortcut Dimension 2 Code" <> '' then
                        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));

                    GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                    GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                    GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                    GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                    GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                    GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                    GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                    GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                    GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                    GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                    GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                    if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                        PostGenJnlLine.RunWithCheck(GenJournalLine)
                    else
                        GenJournalLine.INSERT();
                end;

                if AmountToCustomer <> 0 then begin
                    LineNo += 10000;
                    GenJournalLine.INIT();
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                    GenJournalLine."Line No." := LineNo;
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                    ELSE
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                    GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                    GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                    GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date");
                    GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::Customer);
                    GenJournalLine.VALIDATE("Account No.", HISRevenueHeader."Customer No.");
                    //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                    GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE(Amount, AmountToCustomer)
                    else
                        GenJournalLine.VALIDATE(Amount, -AmountToCustomer);
                    if HISRevenueHeader."Shortcut Dimension 1 Code" <> '' then begin
                        //GenJournalLine.VALIDATE("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                    end;

                    if HISRevenueHeader."Shortcut Dimension 2 Code" <> '' then
                        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));

                    GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                    GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                    GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                    GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                    GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                    GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                    GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                    GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                    GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                    GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                    GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                    if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                        PostGenJnlLine.RunWithCheck(GenJournalLine)
                    else
                        GenJournalLine.INSERT();
                end;
            end;
            HISRevenueHeader."Create Revenue" := TRUE;
            if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                HISRevenueHeader."Posted Document No." := HISRevenueHeader."Document No.";
            HISRevenueHeader.MODIFY();
            if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                Commit();
        END;
    end;

    procedure InitHISPurchaseSaleHeader(PurchInvHdr: Record "Purch. Inv. Header")
    var
        recHISPurchaseSalesHeader: Record "3E HIS Purchase Header";
        recHISPurchaseSalesLine: Record "3E HIS Purchase Line";
        PurchInvLine: Record "Purch. Inv. Line";
        TotalAmount: Decimal;
        EntryNo: Integer;
    begin

        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("GRN Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."GRN Creation Enabled") THEN
            EXIT;

        recHISPurchaseSalesHeader.Reset();
        IF recHISPurchaseSalesHeader.FindLast() THEN
            EntryNo := recHISPurchaseSalesHeader."Entry No." + 1;

        recHISPurchaseSalesHeader.Init();
        recHISPurchaseSalesHeader.Validate("Record Type", recHISPurchaseSalesHeader."Record Type"::GRN);
        recHISPurchaseSalesHeader.Validate("HIS Document Type", PurchInvHdr."Posting Description");
        recHISPurchaseSalesHeader.Validate("Document Type", recHISPurchaseSalesHeader."Document Type"::Order);
        recHISPurchaseSalesHeader.Validate("Document No.", PurchInvHdr."No.");
        recHISPurchaseSalesHeader."Entry No." := EntryNo;
        recHISPurchaseSalesHeader.Insert(true);
        recHISPurchaseSalesHeader.Validate("Document Date", PurchInvHdr."Document Date");
        recHISPurchaseSalesHeader.Validate("Purchase Order No.", PurchInvHdr."Order No.");
        recHISPurchaseSalesHeader.Validate("Purchase Order date", PurchInvHdr."Order Date");
        recHISPurchaseSalesHeader.Validate("Vendor No.", PurchInvHdr."Buy-from Vendor No.");
        recHISPurchaseSalesHeader.Validate("Vendor Name", PurchInvHdr."Buy-from Vendor Name");
        recHISPurchaseSalesHeader.Validate("Vendor Invoice No.", PurchInvHdr."Vendor Invoice No.");
        recHISPurchaseSalesHeader.Validate("Posting Date", PurchInvHdr."Posting Date");
        //CalculateStatistics.GetPostedPurchInvStatisticsAmount(PurchInvHdr, TotalAmount);
        recHISPurchaseSalesHeader.Validate(Amount, TotalAmount);
        recHISPurchaseSalesHeader.Validate("Location Code", PurchInvHdr."Location Code");
        recHISPurchaseSalesHeader.Validate("Shortcut Dimension 1 Code", PurchInvHdr."Shortcut Dimension 1 Code");
        recHISPurchaseSalesHeader.Validate("Shortcut Dimension 2 Code", PurchInvHdr."Shortcut Dimension 2 Code");
        recHISPurchaseSalesHeader.Validate("Create PO", true);
        recHISPurchaseSalesHeader.Validate("Capex Type", PurchInvHdr."3E Capex Type");
        recHISPurchaseSalesHeader."Submitted Date Time" := CurrentDateTime;
        recHISPurchaseSalesHeader."Submitted By" := UserId;
        recHISPurchaseSalesHeader."SQL Created By" := 'ERP';
        recHISPurchaseSalesHeader."SQL Creation Date Time" := CurrentDateTime;
        recHISPurchaseSalesHeader.Validate(Type, recHISPurchaseSalesHeader.Type::Vendor);
        //recHISPurchaseSalesHeader.Validate("Reference Invoice No.", PurchInvHdr."Reference Invoice No.");
        //recHISPurchaseSalesHeader.Validate("Work Order Type", PurchInvHdr."3E Work Order Type");
        recHISPurchaseSalesHeader.Validate("Store Name", PurchInvHdr."Store Name");
        recHISPurchaseSalesHeader.Validate("Item Type", PurchInvHdr."3E Item Type");
        GeneralLedgerSetup.Get();
        DimensionSetEntry.Reset();
        DimensionSetEntry.SetRange("Dimension Set ID", PurchInvHdr."Dimension Set ID");
        DimensionSetEntry.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
        IF DimensionSetEntry.FindFirst() then
            recHISPurchaseSalesHeader.Validate("Shortcut Dimension 3 Code", DimensionSetEntry."Dimension Value Code");
        recHISPurchaseSalesHeader.Modify();

        PurchInvLine.RESET();
        PurchInvLine.SETRANGE(PurchInvLine."Document No.", PurchInvHdr."No.");
        PurchInvLine.SetFilter(Description, '<>%1', '');
        PurchInvLine.SetFilter(Type, '<>%1', PurchInvLine.Type::" ");
        IF PurchInvLine.FINDFIRST() THEN
            REPEAT
                recHISPurchaseSalesHeader.Reset();
                IF recHISPurchaseSalesHeader.FindLast() THEN
                    EntryNo := recHISPurchaseSalesHeader."Entry No." + 1;
                recHISPurchaseSalesLine.INIT();
                recHISPurchaseSalesLine.Validate("Record Type", recHISPurchaseSalesLine."Record Type"::GRN);
                recHISPurchaseSalesLine.Validate("Document Type", recHISPurchaseSalesLine."Document Type"::Order);
                recHISPurchaseSalesLine.validate("Document No.", PurchInvLine."document No.");
                recHISPurchaseSalesLine.VALIDATE("Line No.", PurchInvLine."Line No.");
                recHISPurchaseSalesLine."Entry No." := EntryNo;
                recHISPurchaseSalesLine.validate("Item Type", PurchInvLine.Type);
                recHISPurchaseSalesLine.validate("Item No.", PurchInvLine."No.");
                recHISPurchaseSalesLine.Insert();
                recHISPurchaseSalesLine.VALIDATE("Item ID", PurchInvLine."No.");
                recHISPurchaseSalesLine.VALIDATE("Item Name", PurchInvLine.Description);
                recHISPurchaseSalesLine.VALIDATE("Received Qty", PurchInvLine.Quantity);
                recHISPurchaseSalesLine.Validate("Unit Cost", PurchInvLine."Direct Unit Cost");
                recHISPurchaseSalesLine.Validate(Amount, PurchInvLine."Line Amount");
                recHISPurchaseSalesLine.Validate(Discount, ABS(PurchInvLine."Inv. Discount Amount") + ABS(PurchInvLine."Line Discount Amount"));
                recHISPurchaseSalesLine.Validate("Shortcut Dimension 1 Code", PurchInvLine."Shortcut Dimension 1 Code");
                recHISPurchaseSalesLine.Validate("Shortcut Dimension 2 Code", PurchInvLine."Shortcut Dimension 2 Code");
                recHISPurchaseSalesLine."HIS Item Type" := PurchInvLine."3E HIS Item Type";
                GeneralLedgerSetup.Get();
                DimensionSetEntry.Reset();
                DimensionSetEntry.SetRange("Dimension Set ID", PurchInvLine."Dimension Set ID");
                DimensionSetEntry.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
                IF DimensionSetEntry.FindFirst() then
                    recHISPurchaseSalesLine.Validate("Shortcut Dimension 3 Code", DimensionSetEntry."Dimension Value Code");
                recHISPurchaseSalesLine.Modify();
                PurchInvLine.Modify();
            UNTIL PurchInvLine.NEXT() = 0;
        PurchInvHdr.MODIFY();

    end;

    procedure InitHISPurchaseSaleHeaderGRNReturn(PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.")
    var
        recHISPurchaseSalesHeader: Record "3E HIS Purchase Header";
        recHISPurchaseSalesLine: Record "3E HIS Purchase Line";
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        TotalAmount: Decimal;
        EntryNo: Integer;
    begin

        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("GRN Return Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."GRN Return Creation Enabled") THEN
            EXIT;

        recHISPurchaseSalesHeader.Reset();
        IF recHISPurchaseSalesHeader.FindLast() THEN
            EntryNo := recHISPurchaseSalesHeader."Entry No." + 1;

        recHISPurchaseSalesHeader.Init();
        recHISPurchaseSalesHeader.Validate("Record Type", recHISPurchaseSalesHeader."Record Type"::"GRN Return");
        recHISPurchaseSalesHeader.Validate("HIS Document Type", PurchCrMemoHdr."Posting Description");
        recHISPurchaseSalesHeader.Validate("Document Type", recHISPurchaseSalesHeader."Document Type"::"Return Order");
        recHISPurchaseSalesHeader.Validate("Document No.", PurchCrMemoHdr."No.");
        recHISPurchaseSalesHeader."Entry No." := EntryNo;
        recHISPurchaseSalesHeader.Insert(true);
        recHISPurchaseSalesHeader.Validate("Document Date", PurchCrMemoHdr."Document Date");
        recHISPurchaseSalesHeader.Validate("Purchase Order No.", PurchCrMemoHdr."Return Order No.");
        recHISPurchaseSalesHeader.Validate("Purchase Order date", PurchCrMemoHdr."Document Date");
        recHISPurchaseSalesHeader.Validate("Vendor No.", PurchCrMemoHdr."Buy-from Vendor No.");
        recHISPurchaseSalesHeader.Validate("Vendor Name", PurchCrMemoHdr."Buy-from Vendor Name");
        recHISPurchaseSalesHeader.Validate("Vendor Invoice No.", PurchCrMemoHdr."Vendor Cr. Memo No.");
        recHISPurchaseSalesHeader.Validate("Posting Date", PurchCrMemoHdr."Posting Date");
        //CalculateStatistics.GetPostedPurchCrMemoStatisticsAmount(PurchCrMemoHdr, TotalAmount);
        recHISPurchaseSalesHeader.Validate(Amount, TotalAmount);
        recHISPurchaseSalesHeader.Validate("Location Code", PurchCrMemoHdr."Location Code");
        recHISPurchaseSalesHeader.Validate("Shortcut Dimension 1 Code", PurchCrMemoHdr."Shortcut Dimension 1 Code");
        recHISPurchaseSalesHeader.Validate("Shortcut Dimension 2 Code", PurchCrMemoHdr."Shortcut Dimension 2 Code");
        recHISPurchaseSalesHeader.Validate("Create PO", true);
        recHISPurchaseSalesHeader.Validate("Capex Type", PurchCrMemoHdr."3E Capex Type");
        recHISPurchaseSalesHeader."Submitted Date Time" := CurrentDateTime;
        recHISPurchaseSalesHeader."Submitted By" := UserId;
        recHISPurchaseSalesHeader."SQL Created By" := 'ERP';
        recHISPurchaseSalesHeader."SQL Creation Date Time" := CurrentDateTime;
        recHISPurchaseSalesHeader.Validate(Type, recHISPurchaseSalesHeader.Type::Vendor);
        //recHISPurchaseSalesHeader.Validate("Reference Invoice No.", PurchCrMemoHdr."Reference Invoice No.");
        recHISPurchaseSalesHeader.Validate("Store Name", PurchCrMemoHdr."Store Name");
        recHISPurchaseSalesHeader.Validate("Item Type", PurchCrMemoHdr."3E Item Type");
        GeneralLedgerSetup.Get();
        DimensionSetEntry.Reset();
        DimensionSetEntry.SetRange("Dimension Set ID", PurchCrMemoHdr."Dimension Set ID");
        DimensionSetEntry.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
        IF DimensionSetEntry.FindFirst() then
            recHISPurchaseSalesHeader.Validate("Shortcut Dimension 3 Code", DimensionSetEntry."Dimension Value Code");
        recHISPurchaseSalesHeader.Modify();

        PurchCrMemoLine.RESET();
        PurchCrMemoLine.SETRANGE(PurchCrMemoLine."Document No.", PurchCrMemoHdr."No.");
        PurchCrMemoLine.SetFilter(Description, '<>%1', '');
        PurchCrMemoLine.SetFilter(Type, '<>%1', PurchCrMemoLine.Type::" ");
        IF PurchCrMemoLine.FINDFIRST() THEN
            REPEAT
                recHISPurchaseSalesHeader.Reset();
                IF recHISPurchaseSalesHeader.FindLast() THEN
                    EntryNo := recHISPurchaseSalesHeader."Entry No." + 1;
                recHISPurchaseSalesLine.INIT();
                recHISPurchaseSalesLine.Validate("Record Type", recHISPurchaseSalesLine."Record Type"::"GRN Return");
                recHISPurchaseSalesLine.Validate("Document Type", recHISPurchaseSalesLine."Document Type"::"Return Order");
                recHISPurchaseSalesLine.validate("Document No.", PurchCrMemoLine."document No.");
                recHISPurchaseSalesLine.VALIDATE("Line No.", PurchCrMemoLine."Line No.");
                recHISPurchaseSalesLine."Entry No." := EntryNo;
                recHISPurchaseSalesLine.VALIDATE("Item Type", PurchCrMemoLine.Type);
                recHISPurchaseSalesLine.validate("Item No.", PurchCrMemoLine."No.");
                recHISPurchaseSalesLine.Insert(true);
                recHISPurchaseSalesLine.VALIDATE("Item ID", PurchCrMemoLine."No.");
                recHISPurchaseSalesLine.VALIDATE("Item Name", PurchCrMemoLine.Description);
                recHISPurchaseSalesLine.VALIDATE("Received Qty", PurchCrMemoLine.Quantity);
                recHISPurchaseSalesLine.Validate("Unit Cost", PurchCrMemoLine."Direct Unit Cost");
                recHISPurchaseSalesLine.Validate(Amount, PurchCrMemoLine."Line Amount");

                recHISPurchaseSalesLine.Validate(Discount, ABS(PurchCrMemoLine."Inv. Discount Amount") + ABS(PurchCrMemoLine."Line Discount Amount"));
                recHISPurchaseSalesLine.Validate("Shortcut Dimension 1 Code", PurchCrMemoLine."Shortcut Dimension 1 Code");
                recHISPurchaseSalesLine.Validate("Shortcut Dimension 2 Code", PurchCrMemoLine."Shortcut Dimension 2 Code");
                recHISPurchaseSalesLine."HIS Item Type" := PurchCrMemoLine."3E Item Type";
                GeneralLedgerSetup.Get();
                DimensionSetEntry.Reset();
                DimensionSetEntry.SetRange("Dimension Set ID", PurchCrMemoLine."Dimension Set ID");
                DimensionSetEntry.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
                IF DimensionSetEntry.FindFirst() then
                    recHISPurchaseSalesLine.Validate("Shortcut Dimension 3 Code", DimensionSetEntry."Dimension Value Code");
                recHISPurchaseSalesLine.Modify();
                PurchCrMemoLine.Modify();
            UNTIL PurchCrMemoLine.NEXT() = 0;
        PurchCrMemoHdr.MODIFY();

    end;

    procedure PostGenJnlLineEntries()
    var
        GenJnlLine: Record "Gen. Journal Line";
        HISIntegrationSetupLine: Record "3E HIS Integration Setup Line";
        GenJournalLine1: Record "Gen. Journal Line";
        GenJnlPostBatch: Codeunit "Gen. Jnl.-Post Batch";
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Revenue Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Revenue Creation Enabled") THEN
            EXIT;

        GenJnlLine.RESET();
        GenJnlLine.SETFILTER(GenJnlLine."Account No.", '%1', '');
        GenJnlLine.SETFILTER(GenJnlLine.Amount, '%1', 0);
        IF GenJnlLine.FINDFIRST() THEN BEGIN
            GenJnlLine.DELETEALL;
        END;

        HISIntegrationSetupLine.Reset();
        HISIntegrationSetupLine.SetFilter(Type, '<>%1', IntegrationSetupLine.Type::Consumption);
        IF HISIntegrationSetupLine.FindSet() then
            repeat
                GenJnlLine.RESET();
                GenJnlLine.SETRANGE("Journal Template Name", HISIntegrationSetupLine."General Journal Template Code");
                GenJnlLine.SETRANGE("Journal Batch Name", HISIntegrationSetupLine."General Journal Batch Code");
                IF GenJnlLine.FindSet() THEN
                    REPEAT
                        GenJournalLine1.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                        GenJournalLine1.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                        GenJournalLine1.SETRANGE("Document No.", GenJnlLine."Document No.");
                        GenJournalLine1.SETRANGE("Posting Date", GenJnlLine."Posting Date");
                        IF GenJournalLine1.FINDFIRST() THEN
                            REPEAT
                                GenJnlPostBatch.RUN(GenJournalLine1);
                            UNTIL GenJournalLine1.NEXT() = 0;
                    UNTIL GenJnlLine.NEXT() = 0
                else
                    Error('There is no HIS Entries Pending for the Posting');
            until HISIntegrationSetupLine.Next() = 0;

    end;

    procedure PostGenJnlLineConsumptionEntries()
    var
        GenJnlLine: Record "Gen. Journal Line";
        HISIntegrationSetupLine: Record "3E HIS Integration Setup Line";
        GenJournalLine1: Record "Gen. Journal Line";
        GenJnlPostBatch: Codeunit "Gen. Jnl.-Post Batch";
    begin
        IntegrationSetup.GET();
        IntegrationSetup.TESTFIELD("Integration Enabled", TRUE);
        IntegrationSetup.TESTFIELD("Consumption Creation Enabled", TRUE);


        IF NOT (IntegrationSetup."Integration Enabled") AND (IntegrationSetup."Consumption Creation Enabled") THEN
            EXIT;

        GenJnlLine.RESET();
        GenJnlLine.SETFILTER(GenJnlLine."Account No.", '%1', '');
        GenJnlLine.SETFILTER(GenJnlLine.Amount, '%1', 0);
        IF GenJnlLine.FINDFIRST() THEN BEGIN
            GenJnlLine.DELETEALL();
        END;

        IntegrationSetupLine.Reset();
        IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Consumption);
        IF HISIntegrationSetupLine.FindFirst() then
            repeat
                GenJnlLine.RESET();
                GenJnlLine.SETRANGE("Journal Template Name", HISIntegrationSetupLine."General Journal Template Code");
                GenJnlLine.SETRANGE("Journal Batch Name", HISIntegrationSetupLine."General Journal Batch Code");
                IF GenJnlLine.FINDFIRST() THEN
                    REPEAT
                        GenJournalLine1.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                        GenJournalLine1.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                        GenJournalLine1.SETRANGE("Document No.", GenJnlLine."Document No.");
                        GenJournalLine1.SETRANGE("Posting Date", GenJnlLine."Posting Date");
                        IF GenJournalLine1.FINDFIRST() THEN
                            REPEAT
                                GenJnlPostBatch.RUN(GenJournalLine1);
                            UNTIL GenJournalLine1.NEXT() = 0;
                    UNTIL GenJnlLine.NEXT() = 0
                else
                    Error('No Consumption Entries are Pending for Posting');
            until HISIntegrationSetupLine.Next() = 0;
    end;

    local procedure GetMappedDimension(HISCCode: Code[20]): Code[20]
    var
        LGeneralLedgerSetup: Record "General Ledger Setup";
        DimensionMapping: Record "3E HIS GL Accounts Mapping";
    begin
        if HISCCode = '' then
            exit('');

        LGeneralLedgerSetup.Get();

        DimensionMapping.Reset();
        DimensionMapping.SetRange(Type, DimensionMapping.Type::Dimension);
        DimensionMapping.SetRange("Dimension Code", LGeneralLedgerSetup."Global Dimension 2 Code");
        DimensionMapping.SetRange("HIS Code", HISCCode);
        if DimensionMapping.FindFirst() then
            exit(DimensionMapping."Department Code");
    end;

    local procedure GetMappedDimension5(HISCCode: Code[20]): Code[20]
    var
        LGeneralLedgerSetup: Record "General Ledger Setup";
        DimensionMapping: Record "3E HIS GL Accounts Mapping";
    begin
        if HISCCode = '' then
            exit('');

        LGeneralLedgerSetup.Get();

        DimensionMapping.Reset();
        DimensionMapping.SetRange(Type, DimensionMapping.Type::Dimension);
        DimensionMapping.SetRange("Dimension Code", LGeneralLedgerSetup."Shortcut Dimension 5 Code");
        DimensionMapping.SetRange("HIS Code", HISCCode);
        if DimensionMapping.FindFirst() then
            exit(DimensionMapping."Department Code");
    end;


    procedure CreateAndPostRevenueInvoice(var HISRevenueHeader: Record "3E HIS Revenue Header")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        GenJournalLine: Record "Gen. Journal Line";
        InvoicePostingBuffer: Record "Invoice Posting Buffer" temporary;
        PostGenJnlLine: Codeunit "Gen. Jnl.-Post Line";
        AmountToCustomer: Decimal;
        PatientPayble: Decimal;
        LineNo: Integer;
    begin
        AmountToCustomer := 0;
        PatientPayble := 0;
        IntegrationSetup.GET();
        //IntegrationSetup.testfield("Account Type");
        IntegrationSetup.testfield("Account No.");

        RevenueInvoiceValidation(HISRevenueHeader);

        IF not HISRevenueHeader."Create Revenue" THEN BEGIN
            if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then begin
                SalesHeader.INIT();
                IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN BEGIN
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice
                END ELSE
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                        SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";

                SalesHeader."No." := HISRevenueHeader."Document No.";
                SalesHeader.INSERT(TRUE);
                SalesHeader.VALIDATE("Sell-to Customer No.", HISRevenueHeader."Customer No.");
                SalesHeader.VALIDATE("Order Date", HISRevenueHeader."Document Date");
                if HISRevenueHeader."Posting Date" <> 0D then
                    SalesHeader.VALIDATE("Posting Date", HISRevenueHeader."Posting Date")
                else
                    SalesHeader.Validate("Posting Date", HISRevenueHeader."Document Date");
                SalesHeader.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");
                if HISRevenueHeader."Location Code" <> '' then
                    SalesHeader.VALIDATE("Location Code", HISRevenueHeader."Location Code")
                else
                    SalesHeader.Validate("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                SalesHeader.VALIDATE(SalesHeader."Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));
                SalesHeader.VALIDATE("Posting No. Series", '');
                SalesHeader.VALIDATE("Posting No.", HISRevenueHeader."Document No.");
                //SalesHeader.Validate("Reference Invoice No.", HISRevenueHeader."Reference Invoice No.");
                SalesHeader."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                SalesHeader."3E UHID" := HISRevenueHeader."UHID";
                SalesHeader."3E Patient Name" := HISRevenueHeader."Patient Name";
                SalesHeader."3E Encounter No." := HISRevenueHeader."Encounter No.";
                SalesHeader."3E Doctor Name" := HISRevenueHeader.Doctor;
                SalesHeader."3E Speciality" := HISRevenueHeader."Speciality";
                SalesHeader."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                SalesHeader."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                SalesHeader."3E Payer Code" := HISRevenueHeader."Payer Code";
                SalesHeader."3E Payer Name" := HISRevenueHeader."Payer Name";
                SalesHeader.MODIFY();
            end else begin
                IntegrationSetupLine.Reset();
                IntegrationSetupLine.SetRange(Type, IntegrationSetupLine.Type::Revenue);
                IntegrationSetupLine.FindFirst();
                IntegrationSetupLine.TestField("General Journal Template Code");
                IntegrationSetupLine.TestField("General Journal Batch Code");
            end;

            LineNo := 0;
            if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then begin
                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueHeader."Record Type");
                HISRevenueLine.SetRange("document Type", HISRevenueHeader."document Type");
                HISRevenueLine.SETRANGE(HISRevenueLine."Document No.", SalesHeader."No.");
                HISRevenueLine.SetRange("Package Patient", false);
                IF HISRevenueLine.FINDFIRST() THEN
                    REPEAT
                        LineNo += 10000;
                        SalesLine.INIT();
                        SalesLine.VALIDATE("Document Type", SalesHeader."Document Type");
                        SalesLine."Document No." := SalesHeader."No.";
                        SalesLine.VALIDATE("Line No.", LineNo);
                        SalesLine.VALIDATE(Type, SalesLine.Type::"G/L Account");
                        SalesLine.VALIDATE("No.", HISRevenueLine."Account No.");
                        SalesLine.VALIDATE(Quantity, HISRevenueLine.Qty);
                        SalesLine.VALIDATE(SalesLine."Unit Price", HISRevenueLine.Amount);
                        SalesLine.VALIDATE("Location Code", SalesHeader."Location Code");
                        SalesLine.VALIDATE(SalesLine."Shortcut Dimension 1 Code", SalesHeader."Shortcut Dimension 1 Code");
                        SalesLine.VALIDATE(SalesLine."Shortcut Dimension 2 Code", SalesHeader."Shortcut Dimension 2 Code");
                        SalesLine.Description := COPYSTR(HISRevenueLine."Item Name", 1, 100);
                        SalesLine.VALIDATE("Line Discount Amount", -1 * HISRevenueLine.Discount);
                        SalesLine.INSERT(TRUE);
                    UNTIL HISRevenueLine.NEXT() = 0;
            end else begin
                InvoicePostingBuffer.DeleteAll();
                AmountToCustomer := 0;
                PatientPayble := 0;

                HISRevenueLine.RESET();
                HISRevenueLine.SetRange("Record Type", HISRevenueHeader."Record Type");
                HISRevenueLine.SetRange("document Type", HISRevenueHeader."document Type");
                HISRevenueLine.SETRANGE(HISRevenueLine."Document No.", HISRevenueHeader."Document No.");
                HISRevenueLine.SetRange("Package Patient", false);
                IF HISRevenueLine.FINDFIRST() THEN
                    REPEAT
                        AmountToCustomer += HISRevenueHeader."Payor Payable"; //ak
                        PatientPayble += HISRevenueHeader."Patient Payable"; //ak

                        InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."Account No.");
                        InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                        InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                        if InvoicePostingBuffer.FindFirst() then begin
                            InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-(HISRevenueLine.Amount));
                            InvoicePostingBuffer.Modify();
                        end else begin
                            InvoicePostingBuffer.Init();
                            InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code";
                            InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                            InvoicePostingBuffer."G/L Account" := HISRevenueLine."Account No.";
                            InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                            InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                            InvoicePostingBuffer.Amount := -(HISRevenueLine.Amount);
                            InvoicePostingBuffer.Insert();
                        end;

                        if HISRevenueLine.Discount <> 0 then begin
                            //AmountToCustomer += HISRevenueLine.Discount;
                            InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."Discount G/L Account");
                            InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                            InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                            if InvoicePostingBuffer.FindFirst() then begin
                                InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-HISRevenueLine.Discount);
                                InvoicePostingBuffer.Modify();
                            end else begin
                                InvoicePostingBuffer.Init();
                                InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code" + ';Discount';
                                InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                                InvoicePostingBuffer."G/L Account" := HISRevenueLine."Discount G/L Account";
                                InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                                InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                                InvoicePostingBuffer.Amount := -HISRevenueLine.Discount;
                                InvoicePostingBuffer.Insert();
                            end;
                        end;

                        if HISRevenueLine."MOU Discount" <> 0 then begin
                            //AmountToCustomer += HISRevenueLine.Discount;
                            InvoicePostingBuffer.SetRange("G/L Account", HISRevenueLine."MOU Discount G/L Account");
                            InvoicePostingBuffer.SetRange("Global Dimension 1 Code", HISRevenueLine."Shortcut Dimension 1 Code");
                            InvoicePostingBuffer.SetRange("Global Dimension 2 Code", HISRevenueLine."Shortcut Dimension 2 Code");
                            if InvoicePostingBuffer.FindFirst() then begin
                                InvoicePostingBuffer.Amount := InvoicePostingBuffer.Amount + (-HISRevenueLine."MOU Discount");
                                InvoicePostingBuffer.Modify();
                            end else begin
                                InvoicePostingBuffer.Init();
                                InvoicePostingBuffer."Group ID" := HISRevenueLine."Account No." + ';' + HISRevenueLine."Shortcut Dimension 1 Code" + ';' + HISRevenueLine."Shortcut Dimension 2 Code" + ';MOUDiscount';
                                InvoicePostingBuffer.Type := InvoicePostingBuffer.Type::"G/L Account";
                                InvoicePostingBuffer."G/L Account" := HISRevenueLine."MOU Discount G/L Account";
                                InvoicePostingBuffer."Global Dimension 1 Code" := HISRevenueLine."Shortcut Dimension 1 Code";
                                InvoicePostingBuffer."Global Dimension 2 Code" := HISRevenueLine."Shortcut Dimension 2 Code";
                                InvoicePostingBuffer.Amount := -HISRevenueLine."MOU Discount";
                                InvoicePostingBuffer.Insert();
                            end;
                        end;
                    UNTIL HISRevenueLine.NEXT() = 0;

                GenJournalLine.Reset();
                GenJournalLine.SetRange("Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                GenJournalLine.SetRange("Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                if GenJournalLine.FindLast() then
                    LineNo := GenJournalLine."Line No."
                else
                    LineNo := 0;

                InvoicePostingBuffer.Reset();
                InvoicePostingBuffer.SetFilter(Amount, '<>0');
                if InvoicePostingBuffer.FindSet() then
                    repeat
                        LineNo += 10000;
                        GenJournalLine.INIT();
                        GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                        GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                        GenJournalLine."Line No." := LineNo;
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                        ELSE
                            IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                                GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                        GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                        GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                        if HISRevenueHeader."Posting Date" <> 0D then
                            GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date")
                        else
                            GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Document Date");
                        GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::"G/L Account");
                        GenJournalLine.VALIDATE("Account No.", InvoicePostingBuffer."G/L Account");
                        //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                        GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                            GenJournalLine.VALIDATE(Amount, InvoicePostingBuffer.Amount)
                        else
                            GenJournalLine.VALIDATE(Amount, -InvoicePostingBuffer.Amount);
                        if InvoicePostingBuffer."Global Dimension 1 Code" <> '' then begin
                            //GenJournalLine.VALIDATE("Location Code", InvoicePostingBuffer."Global Dimension 1 Code");
                            GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", InvoicePostingBuffer."Global Dimension 1 Code");
                        end;

                        if InvoicePostingBuffer."Global Dimension 2 Code" <> '' then
                            GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(InvoicePostingBuffer."Global Dimension 2 Code"));

                        GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                        GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                        GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                        GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                        GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                        GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                        GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                        GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                        GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                        GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                        GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                        if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                            PostGenJnlLine.RunWithCheck(GenJournalLine)
                        else
                            GenJournalLine.INSERT();
                    until InvoicePostingBuffer.Next() = 0;

                if PatientPayble <> 0 then begin
                    LineNo += 10000;
                    GenJournalLine.INIT();
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                    GenJournalLine."Line No." := LineNo;
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                    ELSE
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                    GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                    GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                    if HISRevenueHeader."Posting Date" <> 0D then
                        GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date")
                    else
                        GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Document Date");
                    GenJournalLine.VALIDATE("Account Type", IntegrationSetup."Account Type");
                    GenJournalLine.VALIDATE("Account No.", IntegrationSetup."Account No.");
                    //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                    GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE(Amount, PatientPayble)
                    else
                        GenJournalLine.Validate(Amount, -PatientPayble);
                    if HISRevenueHeader."Shortcut Dimension 1 Code" <> '' then begin
                        //GenJournalLine.VALIDATE("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                    end;

                    if HISRevenueHeader."Shortcut Dimension 2 Code" <> '' then
                        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));

                    GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                    GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                    GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                    GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                    GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                    GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                    GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                    GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                    GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                    GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                    GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                    if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                        PostGenJnlLine.RunWithCheck(GenJournalLine)
                    else
                        GenJournalLine.INSERT();
                end;

                if AmountToCustomer <> 0 then begin
                    LineNo += 10000;
                    GenJournalLine.INIT();
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Template Name", IntegrationSetupLine."General Journal Template Code");
                    GenJournalLine.VALIDATE(GenJournalLine."Journal Batch Name", IntegrationSetupLine."General Journal Batch Code");
                    GenJournalLine."Line No." := LineNo;
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::Invoice)
                    ELSE
                        IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::"Revenue Cancel") AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::"Credit Memo") THEN
                            GenJournalLine.VALIDATE("Document Type", GenJournalLine."Document Type"::"Credit Memo");

                    GenJournalLine.VALIDATE("Document No.", HISRevenueHeader."Document No.");
                    GenJournalLine.VALIDATE("Document Date", HISRevenueHeader."Document Date");
                    if HISRevenueHeader."Posting Date" <> 0D then
                        GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Posting Date")
                    else
                        GenJournalLine.VALIDATE("Posting Date", HISRevenueHeader."Document Date");
                    GenJournalLine.VALIDATE("Account Type", GenJournalLine."Account Type"::Customer);
                    GenJournalLine.VALIDATE("Account No.", HISRevenueHeader."Customer No.");
                    //GenJournalLine."Location Code" := HISRevenueHeader."Location Code";
                    GenJournalLine."Your Reference" := HISRevenueHeader."Reference Invoice No.";
                    IF (HISRevenueHeader."Record Type" = HISRevenueHeader."Record Type"::Revenue) AND (HISRevenueHeader."Document Type" = HISRevenueHeader."Document Type"::Invoice) THEN
                        GenJournalLine.VALIDATE(Amount, AmountToCustomer)
                    else
                        GenJournalLine.VALIDATE(Amount, -AmountToCustomer);
                    if HISRevenueHeader."Shortcut Dimension 1 Code" <> '' then begin
                        //GenJournalLine.VALIDATE("Location Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                        GenJournalLine.VALIDATE("Shortcut Dimension 1 Code", HISRevenueHeader."Shortcut Dimension 1 Code");
                    end;

                    if HISRevenueHeader."Shortcut Dimension 2 Code" <> '' then
                        GenJournalLine.VALIDATE("Shortcut Dimension 2 Code", GetMappedDimension(HISRevenueHeader."Shortcut Dimension 2 Code"));

                    GenJournalLine.VALIDATE("External Document No.", HISRevenueHeader."External Document No.");

                    GenJournalLine."3E HIS Document Type" := HISRevenueHeader."HIS Document Type";
                    GenJournalLine."3E UHID" := HISRevenueHeader."UHID";
                    GenJournalLine."3E Patient Name" := HISRevenueHeader."Patient Name";
                    GenJournalLine."3E Encounter No." := HISRevenueHeader."Encounter No.";
                    GenJournalLine."3E Doctor Name" := HISRevenueHeader.Doctor;
                    GenJournalLine."3E Speciality" := HISRevenueHeader."Speciality";
                    GenJournalLine."3E Sponsor Code" := HISRevenueHeader."Sponsor Code";
                    GenJournalLine."3E Sponsor Name" := HISRevenueHeader."Sponsor Name";
                    GenJournalLine."3E Payer Code" := HISRevenueHeader."Payer Code";
                    GenJournalLine."3E Payer Name" := HISRevenueHeader."Payer Name";
                    if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                        PostGenJnlLine.RunWithCheck(GenJournalLine)
                    else
                        GenJournalLine.INSERT();
                end;
            end;
            HISRevenueHeader."Create Revenue" := TRUE;
            if IntegrationSetup."Rev./Rev.Cancel Direct Post" then
                HISRevenueHeader."Posted Document No." := HISRevenueHeader."Document No.";
            HISRevenueHeader.MODIFY();
            Commit();
        END;
    end;

    procedure RevenueInvoiceValidation(var LocHISRevenueHeader: Record "3E HIS Revenue Header")
    var
        RevenueSetup: Record "3E HIS GL Accounts Mapping";
        HISItemMapping: Record "3E HIS Item Mapping";
        HISCustMapping: Record "3E HIS Customer Mapping";
        Customer: Record Customer;
        txtSalesAccount: Text[100];
        LineCount: Integer;
    begin
        LineCount := 0;
        txtSalesAccount := '';
        IntegrationSetup.Get();

        LocHISRevenueHeader."Error 1" := FALSE;
        LocHISRevenueHeader."Error 2" := FALSE;
        LocHISRevenueHeader."Error 3" := FALSE;
        LocHISRevenueHeader."Error 4" := FALSE;
        LocHISRevenueHeader."Error Description" := '';
        LocHISRevenueHeader.MODIFY();

        HISRevenueLine.RESET();
        HISRevenueLine.SetRange("Record Type", LocHISRevenueHeader."Record Type");
        HISRevenueLine.SetRange("Document Type", LocHISRevenueHeader."Document Type");
        HISRevenueLine.SETRANGE("Document No.", LocHISRevenueHeader."Document No.");
        HISRevenueLine.SetRange("Package Patient", false);  //Check if not required
        IF HISRevenueLine.FINDFIRST() THEN BEGIN
            REPEAT
                LineCount += 1;
                if IntegrationSetup."Revenue/Rev. Cancel Handling" = IntegrationSetup."Revenue/Rev. Cancel Handling"::"Via Invoices" then begin

                End;

                IF HISRevenueLine."Account No." = '' THEN begin
                    LocHISRevenueHeader.RESET();
                    LocHISRevenueHeader.SetRange("Record Type", HISRevenueLine."Record Type");
                    LocHISRevenueHeader.SetRange("Document Type", HISRevenueLine."Document Type");
                    LocHISRevenueHeader.SETRANGE("Document No.", HISRevenueLine."Document No.");
                    IF LocHISRevenueHeader.FINDFIRST() THEN begin
                        RevenueSetup.Reset();
                        RevenueSetup.SetRange("Service/Station Head", LocHISRevenueHeader."HIS Document Type");
                        RevenueSetup.SetRange("HIS Code", HISRevenueLine."Service Item Code");
                        RevenueSetup.SetRange(Package, HISRevenueLine."Package Patient");
                        if not RevenueSetup.FindFirst() then
                            txtSalesAccount := 'Revenue Account Missing'
                        else
                            if (RevenueSetup."Account No." <> '') and (RevenueSetup."Discount G/L Account" <> '') and (RevenueSetup."MOU Discount G/L Account" <> '') then begin
                                HISRevenueLine."Account Type" := RevenueSetup."Account Type";
                                HISRevenueLine."Account No." := RevenueSetup."Account No.";
                                HISRevenueLine."Discount G/L Account" := RevenueSetup."Discount G/L Account";
                                HISRevenueLine."MOU Discount G/L Account" := RevenueSetup."MOU Discount G/L Account";
                                if HISRevenueLine."Shortcut Dimension 1 Code" = '' then
                                    HISRevenueLine."Shortcut Dimension 1 Code" := LocHISRevenueHeader."Shortcut Dimension 1 Code";
                                HISRevenueLine.Modify(false);
                            end else
                                txtSalesAccount := 'Revenue or Discounts Account Missing';
                    end;
                end;
            UNTIL HISRevenueLine.NEXT() = 0;

            if LocHISRevenueHeader."No. of Lines" <> LineCount then
                LocHISRevenueHeader."Error Description" := 'Line count mismatch.';

            if LocHISRevenueHeader."Posting Date" = 0D then
                LocHISRevenueHeader."Posting Date" := LocHISRevenueHeader."Document Date";

            if LocHISRevenueHeader."Location Code" = '' then
                LocHISRevenueHeader."Location Code" := LocHISRevenueHeader."Shortcut Dimension 1 Code";

            if LocHISRevenueHeader."Customer No." = '' then begin
                HISCustMapping.Reset();
                HISCustMapping.SetRange("HIS Code", LocHISRevenueHeader."Payer Code");
                if HISCustMapping.FindFirst() then begin
                    Customer.Reset();
                    Customer.SetRange("No.", HISCustMapping."Customer No.");
                    if Customer.FindFirst() then begin
                        LocHISRevenueHeader."Customer No." := Customer."No.";
                        LocHISRevenueHeader."Customer Name" := Customer.Name;
                        LocHISRevenueHeader.Modify();
                    end else
                        LocHISRevenueHeader."Error Description" := 'Customer does not exists.';
                end else
                    LocHISRevenueHeader."Error Description" := 'Customer Mapping Missing';
            end;

            IF (LocHISRevenueHeader."Customer Name" = '') OR (txtSalesAccount <> '') THEN
                LocHISRevenueHeader."Error Description" := 'Kindly Check Customer,HSN Code,GST Group Code';
            // ELSE
            //     HISRevenueHeader."Error Description" := '';

            LocHISRevenueHeader.MODIFY();
        end;

        HISRevenueLine.RESET();
        HISRevenueLine.SetRange("Record Type", LocHISRevenueHeader."Record Type");
        HISRevenueLine.SetRange("Document Type", LocHISRevenueHeader."Document Type");
        HISRevenueLine.SETRANGE("Document No.", LocHISRevenueHeader."Document No.");
        IF NOT HISRevenueLine.FINDFIRST() THEN begin
            LocHISRevenueHeader."Error Description" := 'Integration Line is Empty';
            LocHISRevenueHeader.MODIFY();
        end;

        IF (LocHISRevenueHeader."Customer Name" = '') THEN
            LocHISRevenueHeader."Error 1" := TRUE
        ELSE
            LocHISRevenueHeader."Error 1" := FALSE;
        IF (txtSalesAccount <> '') THEN
            LocHISRevenueHeader."Error 2" := TRUE
        ELSE
            LocHISRevenueHeader."Error 4" := FALSE;
        LocHISRevenueHeader.MODIFY();
        Commit();
    end;

    var
        IntegrationSetup: Record "3E HIS Integartion Setup";
        IntegrationSetupLine: Record "3E HIS Integration Setup Line";
        HisMasterStaging: Record "3E HIS Master Staging";
        HISRevenueStaging: Record "3E HIS Revenue Staging Table";
        DefaultDimension: Record "Default Dimension";
        HISPurchaseSaleHeader: Record "3E HIS Purchase Header";
        HISPurchaseSaleLine: Record "3E HIS Purchase Line";
        HISRevenueHeader: Record "3E HIS Revenue Header";
        HISRevenueLine: Record "3E HIS Revenue Line";
        GeneralLedgerSetup: Record "General Ledger Setup";
        PurchaseInvoiceHeader: Record "Purch. Inv. Header";
        PurchaseCreditMemoHeader: Record "Purch. Cr. Memo Hdr.";
        DimensionSetEntry: Record "Dimension Set Entry";
        Vendor: Record Vendor;
        myInt: Integer;
        GSTState: Code[2];
        SamePANErr: Label 'From postion 3 to 12 in GST Registration No. should be same as it is in PAN No. so delete and then update it.';
        HISSettlementStaging: Record "3E HIS Settlement Staging";


}