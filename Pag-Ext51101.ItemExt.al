pageextension 42119 ItemExt extends "Item List"
{
    layout
    {


    }
    actions
    {

        addafter(History)
        {

            group(DetailedItem)
            {
                Caption = 'Detailed Item';
                action(GetItemDetail)
                {
                    ApplicationArea = basic, suite;

                    Promoted = true;
                    Caption = 'Get Detailed Item';
                    trigger OnAction()
                    var
                        GetDictValuess: Codeunit ItemDict;
                    begin
                        GetDictValuess.GetDictValues()
                    end;

                }
            }
        }
    }
}
