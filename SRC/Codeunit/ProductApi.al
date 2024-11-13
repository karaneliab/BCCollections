codeunit 42115 "SDH Rest Api Mgmt."
{
    trigger OnRun()
    begin
        
    end;
  
  procedure GetRecords(URLToAcess:Text)
  begin

  end;
    procedure PostRecords(URLToAcess:Text)
  begin
    
  end;
    procedure PatchRecords(URLToAcess:Text)
  begin
    
  end;

    procedure DeleteRecords(URLToAcess:Text)
  begin
    
  end;
    procedure CheckMandatoryReset(URLToAcess:Text)
  begin
    if URLToAcess = '' then
       Error('Url cannot Be Empty')
  end;

  var
  Content:HttpContent;
  HttpMethod: Enum "Http Method";
  ResponseMsg: HttpResponseMessage;
  ResponseStatus:Boolean;
  ResponseTxt:Text;
}