pageextension 50000 "3E HIS Business Manager RC" extends "Business Manager Role Center"
{
    actions
    {
        addbefore(Action39)
        {
            group("3E HIS Interface")
            {
                Caption = 'HIS Interface';

                group("3E HIS Setup")
                {
                    Caption = 'Integration Setup';
                    action("3E Setups")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Integration Setup';
                        Image = Setup;
                        RunObject = Page "3E Integration Setup";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Integration Setup action.';
                    }
                    group("3E Masters Setups")
                    {
                        Caption = 'Setups';
                        action("3E MOP Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'MOP Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS MOP Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the MOP Setup action.';
                        }
                        action("3E Pharmacy Setup")
                        {
                            Visible = false;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Pharmacy Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS Pharmacy Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Pharmacy Setup action.';
                        }
                        action("3E Revenue Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Revenue Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS Revenue Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Revenue Setup action.';
                        }
                        action("3E Collection Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Collection Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS Collection Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Collection Setup action.';
                        }
                        action("3E Consumption Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Consumption Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS Consumption Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Consumption Setup action.';
                        }
                        action("3E Settlement Setup")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Settlement Setup';
                            Image = Setup;
                            RunObject = Page "3E HIS Settlement Setup";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Settlement Setup action.';
                        }
                        // action("3E Payment Advice E-Mail Setups")
                        // {
                        //     ApplicationArea = Basic, Suite;
                        //     Caption = 'Payment Advice E-Mail Setups';
                        //     Image = Setup;
                        //     RunObject = Page "3E HIS E-Mail Setup";
                        //     RunPageMode = Create;
                        //     ToolTip = 'Executes the Payment Advice E-Mail Setups action.';
                        // }
                    }
                    group("3E HIS Mapping")
                    {
                        Caption = 'Mapping';

                        action("3E HIS Item Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Item Mapping';
                            Image = Setup;
                            RunObject = Page "3E HIS Item Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Executes the Item Mapping action.';
                        }
                        action("3E HIS UOM Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'UOM Mapping';
                            Image = Setup;
                            RunObject = Page "3E HIS UOM Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Create a new UOM Mapping for HIS Interface.';
                        }
                        action("3E Profit Center")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Dimension Mapping';
                            Image = Setup;
                            RunObject = Page "3E HIS Dimension Setup";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Dimension mapping for HIS Interface.';
                        }
                        action("3E HIS Customer Mapping")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'HIS Customer Mapping';
                            Image = Setup;
                            RunObject = Page "3E HIS Customer Mapping";
                            RunPageMode = Create;
                            ToolTip = 'Executes the HIS Customer Mapping Setups action.';
                        }
                    }
                }
                group("3E HIS Masters")
                {
                    Caption = 'Master';

                    group("3E Masters Create")
                    {
                        Caption = 'Master Create';

                        action("3E HIS Vendor List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Vendors List';
                            Image = NewOrder;
                            RunObject = Page "3E HIS Vendor Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new HIS Vendors for items or services.';
                        }
                        action("3E HIS Customer List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Customers List';
                            Image = NewOrder;
                            RunObject = Page "3E HIS Customer Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Customers for items or services.';
                        }
                        action("3E HIS Emplooyee List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Employees List';
                            Image = NewOrder;
                            RunObject = Page "3E HIS Employee Staging List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Employees for Payroll Entries.';
                        }
                        action("3E HIS items List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Items List';
                            Image = NewOrder;
                            RunObject = Page "3E HIS Item List";
                            RunPageMode = Create;
                            ToolTip = 'Create a new Item for Purchase or Sales.';
                        }
                    }
                    group("3E Master Created Successfully")
                    {
                        Caption = 'Master Created Successfully';

                        action("3E Created HIS Vendor List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Vendors List';
                            Image = Archive;
                            RunObject = Page "3E Posted HIS Vend. Stg. List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Vendors for items or services.';
                        }
                        action("3E Created HIS Customer List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Customers List';
                            Image = Archive;
                            RunObject = Page "3E Posted HIS Customer List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Customers for items or services.';
                        }
                        action("3E Created HIS Employee List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Employees List';
                            Image = Archive;
                            RunObject = Page "3E Posted HIS Employee List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Employees for Payroll Entries.';
                        }
                        action("3E Created HIS items List")
                        {
                            AccessByPermission = TableData "3E HIS Master Staging" = IMD;
                            ApplicationArea = Basic, Suite;
                            Caption = 'Created Items List';
                            Image = Archive;
                            RunObject = Page "3E Posted HIS Item List";
                            RunPageMode = Create;
                            ToolTip = 'Check a new Items for Purchase or Sales.';
                        }
                    }
                }
                group("3E HIS Collection Staging")
                {
                    Caption = 'Collection Entries';

                    action("3E Create HIS Collection Entries")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Staging Table" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Collection Entries';
                        Image = Archive;
                        RunObject = Page "3E HIS Revenue Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Collection Entries for Companies.';
                    }

                    action("3E Created HIS Collection Entries")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Staging Table" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Collection Entries';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS Rev. Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Collection Entries for Companies.';
                    }

                }
                group("3E HIS Pharmacy Staging")
                {
                    Caption = 'Pharmacy Entries';
                    Visible = false;

                    action("3E Create HIS Pharmacy Entries")
                    {
                        AccessByPermission = TableData "3E HIS Pharmacy Entries" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Pharmacy Entries';
                        Image = Archive;
                        RunObject = Page "3E HIS Pharmacy Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Pharmacy Entries for Companies.';
                    }

                    action("3E Created HIS Phamacy Entries")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Phamacy Entries';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS Pharm. Entries";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Phamacy Entries action.';
                    }
                }
                group("3E HIS Consumption Staging")
                {
                    Caption = 'Consumption Entries';

                    action("3E Create HIS Consumption Entries")
                    {
                        AccessByPermission = TableData "3E HIS Consumption Entries" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Consumption Entries';
                        Image = Archive;
                        RunObject = Page "3E HIS Consumption Entries";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Consumption Entries for Companies.';
                    }
                    action("3E Created HIS Consumption Ent.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Consumption Entries';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS Cons. Entries";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Consumption Entries action.';
                    }

                }
                group("3E HIS GRN Entries")
                {
                    Caption = 'GRN Entries';

                    action("3E HIS GRN")
                    {
                        AccessByPermission = TableData "3E HIS Purchase Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create GRN';
                        Image = Archive;
                        RunObject = Page "3E HIS GRN List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new GRN Entries for Vendor.';
                    }
                    action("3E Created HIS GRN")
                    {
                        AccessByPermission = TableData "3E HIS Purchase Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created GRN';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS GRN List";
                        RunPageMode = Create;
                        ToolTip = 'Created a GRN Entries for Vendor.';
                    }
                }

                group("3E HIS GRN Return Entries")
                {
                    Caption = 'GRN Return Entries';

                    action("3E HIS GRN Return")
                    {
                        AccessByPermission = TableData "3E HIS Purchase Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create GRN Return';
                        Image = Archive;
                        RunObject = Page "3E HIS GRN Return List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new GRN Return Entries for Vendor.';
                    }
                    action("3E Created HIS GRN Return")
                    {
                        AccessByPermission = TableData "3E HIS Purchase Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created GRN Return';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS GRN Return List";
                        RunPageMode = Create;
                        ToolTip = 'Created a GRN ReturnEntries for Vendor.';
                    }
                }
                group("3E HIS Revenue Invoice Entries")
                {
                    Caption = 'Revenue Invoice Entries';
                    action("3E HIS Revenue Invoice")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create Revenue Invoice';
                        Image = Archive;
                        RunObject = Page "3E HIS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Create Revenue Invoice action.';
                    }
                    action("3E Created HIS Revenue Invoice")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "3E Posted HIS Revenue List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Invoice action.';
                        Caption = 'Created Revenue Invoice';
                    }
                }
                group("3E HIS Revenue Cancel Entries")
                {
                    Caption = 'Revenue Cancel Entries';
                    action("3E HIS Revenue Cancel")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "3E HIS Revenue Cancel List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Revenue Cancel action.';
                        Caption = 'Create Revenue Cancel';
                    }
                    action("3E Created HIS Revenue Cancel")
                    {
                        AccessByPermission = TableData "3E HIS Revenue Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Image = Archive;
                        RunObject = Page "3E HIS Posted Rev Cancel List";
                        RunPageMode = Create;
                        ToolTip = 'Executes the Created Revenue Cancel action.';
                        Caption = 'Created Revenue Cancel';
                    }
                }
                group("3E HIS Settlement Staging")
                {
                    Caption = 'Settlement Entries';

                    action("3E Create HIS Settlement Entries")
                    {
                        AccessByPermission = TableData "3E HIS Settlement Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Settlement Entries';
                        Image = Archive;
                        RunObject = Page "3E HIS Settlement Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Create a new Settlement Entries for Companies.';
                    }
                    action("3E Created HIS Settlement Entries")
                    {
                        AccessByPermission = TableData "3E HIS Settlement Staging" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Settlement Entries';
                        Image = Archive;
                        RunObject = Page "3E Posted HIS Sett. Stagging";
                        RunPageMode = Create;
                        ToolTip = 'Check a new Posted Settlement Entries for Companies.';
                    }
                }
                group("Indent Purchase Entries")
                {
                    action("Indent Purchase/Return")
                    {
                        AccessByPermission = TableData "3E HIS Indent Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Indent Purchase/Return';
                        Image = Indent;
                        // Promoted = true;
                        // PromotedIsBig = true;
                        RunObject = page "3E HIS Purchase Indent List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new HIS Indent Entries for Vendor.';
                    }
                    action("Created Indent Purchase/Return")
                    {
                        AccessByPermission = TableData "3E HIS Indent Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Indent Purchase/Return';
                        Image = Indent;
                        //Promoted = true;
                        //PromotedIsBig = true;
                        RunObject = page "3E HIS Creat Purch Indent List";
                        RunPageMode = Create;
                        ToolTip = 'Created a HIS Indent Entries for Vendor.';
                    }
                }
                group("Indent Sale Return Entries")
                {
                    action("3E Indent Sales/Return")
                    {
                        AccessByPermission = TableData "3E HIS Indent Header" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Indent Sales/Return';
                        Image = Indent;
                        Promoted = true;
                        //PromotedIsBig = true;
                        RunObject = page "3E HIS Sales Indent List";
                        RunPageMode = Create;
                        ToolTip = 'Create a new HIS Indent Sale Entries for Customer.';
                    }
                    action("Created Indent Sales/Return")
                    {
                        AccessByPermission = TableData "3E HIS Indent Header" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Created Indent Sales/Return';
                        Image = Indent;
                        RunObject = page "3E HIS Creat Sales Indent List";
                        RunPageMode = Create;
                        ToolTip = 'Created a HIS Indent ReturnEntries for Customer.';
                    }

                }
            }
        }
    }
}

