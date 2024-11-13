codeunit 42110 ItemDict
{
    local procedure GetItemDict(): Dictionary of [code[20], Dictionary of [Integer, Text]]
    Var
        Item: Record Item;
        ItemDict: Dictionary of [Code[20], Dictionary of [Integer, Text]];
        DetailItemDict: Dictionary of [Integer, Text];
    begin
        if Item.FindSet() then
            repeat
                DetailItemDict.Add(1, Item.Description);
                DetailItemDict.Add(2, Item."Base Unit of Measure");
                DetailItemDict.Add(3, Format(Item."Unit Price"));
                ItemDict.Add(Item."No.", DetailItemDict);
                Clear(DetailItemDict);
            until Item.Next() = 0;
        exit(ItemDict);
    end;

    procedure GetDictValues()
    var
        ItemDict: Dictionary of [Code[20], Dictionary of [Integer, Text]];
        Detail: Text;
        Dict: Dictionary of [Integer, Text];
        i: Integer;
        ItemNo: Code[20];
        NooSerie: Codeunit "No. Series";

    begin
        ItemDict := GetItemDict();
        i := 1;
        foreach Dict in ItemDict.Values do begin
            foreach Detail in dict.Values do begin
                ItemDict.Keys.Get(i, ItemNo);
                Message(Format(ItemNo) + ':' + Detail);
            end;
            i += 1;
        end;
    end;
}