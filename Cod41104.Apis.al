codeunit 42114 Apis
{
    procedure SetHeaders(var Content: HttpContent)
    var
        ContentHeaders: HttpHeaders;
    begin
        content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

    end;
 

    procedure GetRecords()
    var
        client: HttpClient;
        response: HttpResponseMessage;
        request: HttpRequestMessage;
        outputString: Text;
        UserName: Text[100];
        Password: Text[100];
        RequestHeaders: HttpHeaders;
        Base64Convert: Codeunit "Base64 Convert";
        AuthValue: text;
        Content: HttpContent;


    begin
        UserName := 'Karanell';
        Password := 'Karan7884.';
        AuthValue := Base64Convert.ToBase64(UserName + ':' + Password);

        request.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();

        RequestHeaders.Add('Authorization', 'Basic ' + AuthValue);

        Content.GetHeaders(RequestHeaders);
        // RequestHeaders.Clear();
        // RequestHeaders.Add('Content-Type', 'application/json');
        Message('Authorization Header: Basic %1', AuthValue);
        //request.SetRequestUri('http://desktop-vji7f4v:7048/BC240/ODataV4/$metadata#Company(''CRONUS%20International%20Ltd.'')/SalesDashboard');
        request.SetRequestUri('http://desktop-vji7f4v:7048/BC240/ODataV4/Company(''CRONUS%20International%20Ltd.'')/SalesDashboard');
        request.Method := 'GET';
        // response.Headers(RequestHeaders);
        if client.Send(request, response) then
            if response.IsSuccessStatusCode() then begin
                response.Content.ReadAs(outputString);
                Message('%1', outputString);
                ParseEmployeeResponse(outputString)
            end else
                Error('Error %1', response.ReasonPhrase);

    end;

    procedure PostRecords()
    var
        client: HttpClient;
        response: HttpResponseMessage;
        request: HttpRequestMessage;
        outputString: Text;
        UserName: Text[100];
        Password: Text[100];
        RequestHeaders: HttpHeaders;
        Base64Convert: Codeunit "Base64 Convert";
        AuthValue: text;
        Content: HttpContent;



    begin
        UserName := 'Karanell';
        Password := 'Karan7884.';
        request.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();

        RequestHeaders.Add('Authorization', 'Basic ' + AuthValue);

        // Content.GetHeaders(RequestHeaders);/
        Content.WriteFrom(GeneratePayload());
        Content.GetHeaders(RequestHeaders);
        // RequestHeaders.Clear();
        // RequestHeaders.Add('Content-Type', 'application/json');
        request.Content(Content);
        //request.SetRequestUri('http://desktop-vji7f4v:7048/BC240/ODataV4/$metadata#Company(''CRONUS%20International%20Ltd.'')/SalesDashboard');
        request.SetRequestUri('http://desktop-vji7f4v:7048/BC240/ODataV4/Company(''CRONUS%20International%20Ltd.'')/SalesDashboard');
        request.Method := 'Post';
        // response.Headers(RequestHeaders);
        // AuthValue := Base64Convert.ToBase64(UserName + ':' + Password);


        // RequestHeaders.Add('Authorization', 'Basic ' + AuthValue);
        // Message('Authorization Header: Basic %1', AuthValue);




        if client.Send(request, response) then
            if response.IsSuccessStatusCode() then begin
                response.Content.ReadAs(outputString);
                Message('%1', outputString);

            end else
                Error('Error %1', response.ReasonPhrase);

    end;

    procedure UpdateRecords(DemoTable: Record PisalesDashboardDemo)
    var
        client: HttpClient;
        response: HttpResponseMessage;
        request: HttpRequestMessage;
        outputString: Text;
        UserName: Text[100];
        Password: Text[100];
        RequestHeaders: HttpHeaders;
        Base64Convert: Codeunit "Base64 Convert";
        AuthValue: text;
        Content: HttpContent;
        TargetUrl: Label 'http://desktop-vji7f4v:7048/BC240/ODataV4/Company(''CRONUS%20International%20Ltd.'')/SalesDashboard/%1';



    begin

        Content.WriteFrom(GeneratePutPayload());
        Content.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();
        RequestHeaders.Add('Content-Type', 'application/json');
        request.Content(Content);
        request.SetRequestUri(StrSubstNo(TargetUrl, DemoTable.ResponseEntryNo));//with specific id
        request.Method := 'PUT';
        // response.Headers(RequestHeaders);
        //
        if client.Send(request, response) then
            if response.IsSuccessStatusCode() then begin
                response.Content.ReadAs(outputString);
                Message('%1', outputString);

            end else
                Error('Error %1', response.ReasonPhrase);

    end;

    procedure DeleteRecords(DemoTable: Record PisalesDashboardDemo)
    var
        client: HttpClient;
        response: HttpResponseMessage;
        request: HttpRequestMessage;
        outputString: Text;
        UserName: Text[100];
        Password: Text[100];
        RequestHeaders: HttpHeaders;
        Base64Convert: Codeunit "Base64 Convert";
        AuthValue: text;
        Content: HttpContent;
        TargetUrl: Label 'http://desktop-vji7f4v:7048/BC240/ODataV4/Company(''CRONUS%20International%20Ltd.'')/SalesDashboard/%1';



    begin
        UserName := 'Karanell';
        Password := 'Karan7884.';
        AuthValue := Base64Convert.ToBase64(UserName + ':' + Password);

        request.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();

        RequestHeaders.Add('Authorization', 'Basic ' + AuthValue);

        Content.GetHeaders(RequestHeaders);

        // Content.GetHeaders(RequestHeaders);
        // RequestHeaders.Clear();
        RequestHeaders.Add('Content-Type', 'application/json');
        request.Content(Content);
        request.SetRequestUri(StrSubstNo(TargetUrl, DemoTable.ResponseEntryNo));//with specific id
        request.Method := 'Delete';
        // response.Headers(RequestHeaders);
        //
        if client.Send(request, response) then
            if response.IsSuccessStatusCode() then begin
                response.Content.ReadAs(outputString);
                Message('%1', outputString);

            end else
                Error('Error %1', response.ReasonPhrase);

    end;

    local procedure GeneratePutPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('ResponseEntryNo', 154);
        jsonpayload.add('ResponseDocNo', 1569);
        jsonPayload.add('ResponseCustName', 'eliab karan');
        JsonPayload.Add('ResponseCName', 'Kenya');
        JsonPayload.Add('ResponsePstDate', '12/12/2024');
        JsonPayload.WriteTo(Payload);


    end;

    local procedure GeneratePayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('ResponseEntryNo', 1156);
        jsonpayload.add('ResponseDocNo', 1568);
        jsonPayload.add('ResponseCustName', 'eliab');
        JsonPayload.Add('ResponseCName', 'Kenya');
        JsonPayload.Add('ResponsePstDate', '12/12/2024');
        JsonPayload.WriteTo(Payload);
        Message(Payload)

    end;

    local procedure ParseEmployeeResponse(OutputString: Text)
    var
        SalesJson: JsonObject;
        SalesObject: JsonObject;
        SalesArray: JsonArray;
        SaleesToken: JsonToken;
        SaleeToken: JsonToken;
        OdataV4JsonToken: JsonToken;
        ResultToken: JsonToken;
        ResponseEntryNo: Integer;
        ResponseDocNo: Code[20];
        ResponseCustName: Text[250];
        ResponsePstDate: Date;
        ResponseCName: Text[250];


    begin
        SalesJson.ReadFrom(OutputString);
        if SalesJson.Get('@odata.context', OdataV4JsonToken) then
            if OdataV4JsonToken.AsValue().AsText() <> 'http://desktop-vji7f4v:7048/BC240/ODataV4/$metadata#Company(''CRONUS%20International%20Ltd.'')/SalesDashboard' then
                exit;

        if SalesJson.Get('value', SaleesToken) then
            if SaleesToken.IsArray() then
                SalesArray := SaleesToken.AsArray();
        foreach SaleeToken in SalesArray do begin
            Clear(ResponseCName);
            Clear(ResponsePstDate);
            Clear(ResponseEntryNo);
            Clear(ResponseCustName);
            Clear(ResponseDocNo);


            SalesObject := SaleeToken.AsObject();
            SalesObject.Get('CountryRegionName', ResultToken);
            ResponseCName := ResultToken.AsValue().AsText();

            SalesObject.Get('Posting_Date', ResultToken);
            ResponsePstDate := ResultToken.AsValue().AsDate();

            SalesObject.Get('CustomerName', ResultToken);
            ResponseCustName := ResultToken.AsValue().AsText();

            SalesObject.Get('Entry_No', ResultToken);
            ResponseEntryNo := ResultToken.AsValue().AsInteger();

            SalesObject.Get('Document_No', ResultToken);
            ResponseDocNo := ResultToken.AsValue().AsCode();


            //Message('%1',ResultToken.AsValue().AsText())
            WriteRecordsInDb(ResponseCName, ResponsePstDate, ResponseCustName, ResponseEntryNo, ResponseDocNo)
        end;

    end;

    local procedure WriteRecordsInDb(var ResponseCName: Text; var ResponsePstDate: Date; var ResponseCustName: Text; ResponseEntryNo: Integer; ResponseDocNo: Code[20])
    var
        DemoTable: Record PisalesDashboardDemo;

    begin
        if ResponseEntryNo = 0 then
            exit;
        if DemoTable.Get(ResponseEntryNo) then
            exit;
        DemoTable.Init();
        DemoTable.Validate(ResponseCName, ResponseCName);
        DemoTable.Validate(ResponseCustName, ResponseCustName);
        DemoTable.Validate(ResponseDocNo, ResponseDocNo);
        DemoTable.validate(ResponseEntryNo, ResponseEntryNo);
        DemoTable.Validate(ResponsePstDate, ResponsePstDate);
        DemoTable.Insert(True);
        Clear(ResponseCName);
        Clear(ResponsePstDate);
        Clear(ResponseEntryNo);
        Clear(ResponseCustName);
        Clear(ResponseDocNo);
    end;

}
