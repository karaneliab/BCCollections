codeunit 42117 "SDH Customer Api Resp Mgmt"
{
    procedure GetRecords(URLToAcess: Text)
    begin

    end;

    procedure PostRecords(URLToAcess: Text)
    begin

    end;

    procedure PatchRecords(URLToAcess: Text)
    begin

    end;

    procedure DeleteRecords(URLToAcess: Text)
    begin

    end;

    local procedure CheckMandatoryReset(URLToAcess: Text)
    begin
        if URLToAcess = '' then
            Error('Url cannot Be Empty');
        if StrPos(URLToAcess, '%1') > 0 THEN
            Error('Execute Url cannot have %1');

        Clear(ResponseMsg);
        clear(HttpMethod);
        Clear(ResponseStatus);
    end;

    local procedure ProcessResponse(ResponseMsg: HttpResponseMessage; HttpMethod: Enum "Http Method")
    begin
        ResponseMsg.Content.ReadAs(ResponseTxt);
        if not ResponseMsg.IsSuccessStatusCode then
            Error('%1 - %2', ResponseMsg.HttpStatusCode, ResponseTxt)
        else
            Message('%1', ResponseTxt);
    end;

    procedure GetContentwithHeader(Payload: Text;var updateclient: HttpClient) content: HttpContent
    var
        ContentHeaders: HttpHeaders;
    begin
        if Payload <> '' then
            content.WriteFrom(Payload);

        ContentHeaders := updateclient.DefaultRequestHeaders();
        ContentHeaders.Add('Authorization',GetAuthorizationHeader());
        ContentHeaders.ADD('Accept','Application/json');
      
    end;
    local  procedure GetAuthorizationHeader()Authstring:Text
    var
    Base64Convert: Codeunit "Base64 Convert";
    begin
        Authstring := StrSubstNo('%1:%2',Username,Password);
        Authstring :=Base64Convert.ToBase64(Authstring);
        Authstring := StrSubstNo('Basic %1',Authstring);
    end;

    Procedure SetUsernameandPassword(Username: Text; Password: Text)
    begin
        Username := Username;
        Password := Password;
    end;


    var
        Content: HttpContent;
        ResponseMsg: HttpResponseMessage;
        HttpMethod: Enum "Http Method";
        ResponseStatus: Boolean;
        ResponseTxt: Text;
        Username: Text; Password: Text;
}