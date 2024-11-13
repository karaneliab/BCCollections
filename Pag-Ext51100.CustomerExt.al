pageextension 42118 Customer extends "Customer Card"
{
    layout
    {


    }
    actions
    {

        addafter(SendApprovalRequest)
        {

            group(MailSending)
            {
                Caption = 'Exibited Mail';
                action(ExibitedMail)
                {
                    ApplicationArea = basic, suite;

                    Promoted = true;
                    Caption = 'Exibited Mail';
                    trigger OnAction()
                    var
                        SendMails: Codeunit "ListMgmt.";
                        CustomerNo: Code[20];
                        Customer: Record Customer;
                        Balance: Decimal;
                    begin
                        SendMails.SendMailToCustomersAboveAndDueBalance(Balance)
                    end;

                }
            }
        }
    }
}
