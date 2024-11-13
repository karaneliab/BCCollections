codeunit 42111 "Array Method"
{
    trigger OnRun()
    begin
        Arrays[1] := 'One';
        Arrays[1] := 'Two';
        Arrays[1] := '';
        Arrays[1] := 'four';
        Arrays[1] := 'five';
        Arrays[1] := '';
        Arrays[1] := '';
        Arrays[1] := 'eight';
        Arrays[1] := 'Nine';
        Arrays[1] := '';
        ArrayLeng := ArrayLen(Arrays);
        CopyArray(ArraysTwo, arrays, 1, 5);
        CompressArray(Arrays);

        Message('Array lenght is % 1', ArrayLeng);
        Message('Copy of the array is \%1\%2\%3\%4', ArraysTwo[1], ArraysTwo[2], ArraysTwo[3], ArraysTwo[4]);
    end;

    var
        Arrays: array[10] of Text;
        ArrayLeng: Integer;
        ArraysTwo: array[5] of Text;
}

pageextension 42114 SalesExt extends "Salespersons/Purchasers"
{
    layout
    {
        // Add changes to page layout here
        //
    }

    actions
    {
        // Add changes to page actions here
        addafter(CreateInteraction)
        {
            action(ArrayLenght)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    lenghty.Run()
                end;
            }
            action(CopyArray)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CopyArray.Run();
                end;
            }
            action(CompressArray)
            {
                trigger OnAction()
                begin
                    CompressArray.Run();
                end;
            }
        }
    }
    // procedure GetNextNoSeriesNo(var No: Code[20])
    // var
    //     NoSeries: Codeunit "No. Series";
    //     NoSeriesBatch: Codeunit "No. Series - Batch";
    //     Glsetup: Record "Purchases & Payables Setup";

    // begin
    //     if No = '' then begin
    //         Glsetup.Get();
    //         Glsetup.TestField("Blanket Order Nos.");
    //         if NoSeries.AreRelated(Glsetup."Blanket Order Nos.", xRec, "No. Series") then
    //             "No. Series" := xRec."No. Series";
    //         else
    //         "No.Series" := Glsetup."Blanket Order Nos.";
    //         No := NoSeries.GetNextNo("No. Series", WorkDate());

    //     end;
    
    // end;

    var
        lenghty: Codeunit "Array Method";
        CopyArray: Codeunit "Array Method";
        CompressArray: Codeunit "Array Method";
}

