page 42110 ValuesTablePage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ValuesTable;
    Caption = 'Values Trial Page';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    visible = false;
                    Caption = 'specifies the value of the code field';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of Description field';
                }
                field(Value; Rec.Value)
                {
                    ToolTip = 'Specifies  value of the Value field';
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        cust: Record Customer;
        CustomerCount: Integer;
        i: Integer;
        j: Integer;
        ValuesTable: record ValuesTable;
        //add or append elements and access using the index
        arrayOfCustomer: array[100] of Record Customer;
        arrayOfValue: array[5, 9] of Decimal;

    begin
        //ValuesTable.DeleteAll();
        repeat
            CustomerCount += 1;
            arrayOfCustomer[CustomerCount] := cust;
        until cust.Next = 0;

        Message(Format(arrayOfCustomer[7]));

        for i := 1 to 5 do
            for j := 1 to 9 do begin
                arrayOfValue[i,j] := i * j;
                ValuesTable.Init();
                ValuesTable.Code := 0;
                ValuesTable.Description := 'Element['+Format(i)+','+Format(j)+']';
                ValuesTable.Value := arrayOfValue[i,j];
                ValuesTable.Insert();
            end;
            Message(Format('The Count is :' + Format(ValuesTable.count)))

    end;
}