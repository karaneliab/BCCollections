codeunit 42112 "Json Object"
{
    procedure CreateJsonOrder(SalesHeader: Record "Sales Header")
    var
        HeadeJsonObject: JsonObject;
        LinesJsonObject: JsonObject;
        JsonArray: JsonArray;
        SalesLine: Record "Sales Line";
    begin
        HeadeJsonObject.Add('DocumentType', SalesHeader."Document Type".AsInteger());
        HeadeJsonObject.Add('No.', SalesHeader."No.");
        HeadeJsonObject.Add('SellToCustNo', SalesHeader."Sell-to Contact No.");
        HeadeJsonObject.Add('PostingDate', SalesHeader."Posting Date");

        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        if SalesHeader.FindSet() then
            repeat
                Clear(LinesJsonObject);
                LinesJsonObject.Add('LineNo', SalesLine."Line No.");
                LinesJsonObject.Add('Type', SalesLine."Document Type".AsInteger());
                LinesJsonObject.Add('No', SalesLine."No.");
                LinesJsonObject.Add('Quantity', SalesLine.Quantity);
                LinesJsonObject.Add('UnitPrice', SalesLine."Unit Price");
                JsonArray.Add(LinesJsonObject);

            until SalesLine.Next() = 0;
        HeadeJsonObject.Add('Lines', JsonArray);
        Message(Format(HeadeJsonObject));
    end;

}
