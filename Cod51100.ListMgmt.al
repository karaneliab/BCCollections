codeunit 42113 "ListMgmt."
{
    procedure SplitIntoList()
    var
        RecipientList: List of [Text];
        Separators: Text;
        Recipient: Text;
        RecepientsString: Text;

    begin
        Separators := ';,';
        RecepientsString := 'eliabkaran7884;captainkim@gmail.com,judyjemeli32@gmail.com';
        RecipientList := RecepientsString.Split(Separators.Split());

        foreach Recipient in RecipientList do begin
            // Do something with Recepient
            Message(RecipientList.Get(RecipientList.IndexOf(Recipient)));
        end;

    end;
    //* we can store a list of customers above a certain balance and due balance.
    // *Then, we can send an email or perform any other operation with these customers.

    procedure SendMailToCustomersAboveAndDueBalance(Balance: Decimal)
    var
        CustomerList: List of [Code[20]];
        CustomerNo: Code[20];
    begin
        AddCustomerAboveBalance(Balance, CustomerList);
        AddCustomerDueBalance(CustomerList);

        foreach CustomerNo in CustomerList do begin
            SendMailToCust(CustomerNo);
        end;

    end;

    procedure AddCustomerAboveBalance(Balance: Decimal; var CustomerList: List of [Code[20]])
    var

        Customer: Record Customer;
    begin
        Customer.SetAutoCalcFields(Balance);
        if Customer.FindSet(false) then
            repeat
                IF Customer.Balance > Balance then
                    if not CustomerList.Contains(Customer."No.") then
                        CustomerList.Add(Customer."No.");
            Until Customer.Next() = 0;
    end;

    procedure AddCustomerDueBalance(var CustomerList: List of [Code[20]])
    var
        Customer: Record Customer;
    begin
        Customer.SetAutoCalcFields(Balance);
        if Customer.FindSet(false) then
            repeat
                IF Customer."Balance Due" > 0 then
                    if not CustomerList.Contains(Customer."No.") then
                        CustomerList.Add(Customer."No.");
            Until Customer.Next() = 0;
    end;

    procedure SendMail(Customer: Record Customer)
    var
        CustomerNo: Code[20];
        CustDictionary: Dictionary of [Code[20], Code[20]];
    begin
        CustDictionary := GetCustDictionary(Customer);
        foreach CustomerNo in CustDictionary.Keys do begin
            SendMailToCust(CustomerNo);
        end;

    end;

    local procedure GetCustDictionary(Customer: Record Customer): Dictionary of [Code[20], Code[20]]
    var
        CustDictionary: Dictionary of [Code[20], Code[20]];
    begin
        if Customer.FindSet() then
            repeat
                if CustDictionary.Add(Customer."No.", Customer."No.") then;
            Until Customer.Next() = 0;
        exit(CustDictionary);
    end;

    // procedure SendMailToCust(CustomerNo: Code[20])

    // var
    //     Email: Codeunit Email;
    //     EmailMessage: CodeUnit "Email Message";
    //     Customer: Record Customer;
    //     EmailBody: Text;
    //     EmailSubject: Text;
    //     SenderEmail: Text;
    //     RecipientEmail: Text;
    //     SubjectText: Text;
    //     EmailRecipientType: Enum "Email Recipient Type";
    // begin
    //     if Customer.Get(CustomerNo) then begin
    //         if Customer."E-Mail" = '' then
    //             Error('The customer %1 does not have an email address', CustomerNo);
    //         RecipientEmail := Customer."E-Mail";

    //         EmailBody := 'Dear ' + Customer.Name + ',' +
    //                     '\n\nYour current balance is: ' + Format(Customer.Balance) + '.' +
    //                     '\nPlease make sure to settle your account.' +
    //                     '\n\nBest regards,' +
    //                     '\nYour Company Name';

    //         SubjectText := 'Account Balance Notification';


    //         EmailMessage.Create(SenderEmail, RecipientEmail, SubjectText, EmailBody, false);


    //         EmailRecipientType := EmailRecipientType::To;
    //         EmailMessage.AddRecipient(EmailRecipientType, RecipientEmail);


    //         if not Email.Send(EmailMessage) then
    //             Error('Failed to send the email to customer %1.', CustomerNo);
    //     end else
    //         Error('Customer %1 does not exist.', CustomerNo);


    // end;

    procedure SendMailToCust(CustomerNo: Code[20])
    var
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        Customer: Record Customer;
        ToRecipients: List of [Text];
        CCRecipients: List of [Text];
        BCCRecipients: List of [Text];
        BodyText: Text;
        SubjectText: Text;
        CompanyInfo: Record "Company Information";
    begin

        if Customer.Get(CustomerNo) then begin

            if Customer."E-Mail" = '' then
                Error('Customer %1 does not have an email address.', CustomerNo);


            ToRecipients.Add(Customer."E-Mail");

            BodyText := 'Dear ' + Customer.Name + ',' +
                        'Your current balance is: ' + Format(Customer."Balance (LCY)") + '.' +
                        'Please make sure to settle your account.' +
                        'n\Best regards,' +
                         Format(CompanyInfo.Name) ;


            SubjectText := 'Account Balance Notification';


            EmailMessage.Create(ToRecipients, SubjectText, BodyText, false, CCRecipients, BCCRecipients);
            Message('Mail sent successfully');


            if not Email.Send(EmailMessage) then
                Error('Failed to send the email to customer %1.', CustomerNo);
        end else
            Error('Customer %1 does not exist.', CustomerNo);
    end;

}
