codeunit 42116 "SDH Rest Api Mgt."
{
    procedure MakeRequest(URLToAccess: Text; client: HttpClient; content: HttpContent; HttpMethod: Enum "Http Method") response: HttpResponseMessage
    var
        request: HttpRequestMessage;
        ResponseStatus: Boolean;
    begin
        request.Content := content;
        request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                request.Method := 'GET';
            HttpMethod::POST:
                request.Method := 'POST';
            HttpMethod::PATCH:
                request.Method := 'PATCH';
            HttpMethod::Delete:
                request.Method := 'DELETE';


        end;
        ResponseStatus := client.Send(request, response);
        LogApiTransaction(URLToAccess, HttpMethod, ResponseStatus, request, response);
    end;

    procedure MakeRequest(URLToAccess: Text; request: HttpRequestMessage; HttpMethod: Enum System.RestClient."Http Method") response: HttpResponseMessage
    var
        client: HttpClient;
        ResponseStatus: Boolean;
    begin
        request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                request.Method := 'GET';
            HttpMethod::POST:
                request.Method := 'POST';
            HttpMethod::PUT:
                request.Method := 'PUT';
            HttpMethod::PATCH:
                request.Method := 'PATCH';
            HttpMethod::DELETE:
                request.Method := 'DELETE';
        end;
        ResponseStatus := client.Send(request, response);
        LogApiTransaction(URLToAccess, HttpMethod, ResponseStatus, request, response);
    end;

    procedure LogApiTransaction(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; var ResponseStatus: Boolean; request: HttpRequestMessage; var response: HttpResponseMessage)
    var
        LogEntry: Record "SDH API Log Entries";
        RequestInstream, ResponseInstream : InStream;
    begin
        request.Content.ReadAs(RequestInstream);
        request.content.readas(ResponseInstream);
        LogEntry.AddNewLogEntry(URLToAccess, HttpMethod, RequestInstream, ResponseInstream, response.HttpStatusCode, ResponseStatus);
    end;


 
    var
        content: HttpContent;
}
