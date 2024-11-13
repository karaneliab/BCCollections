page 42220 "Demo Apii Page"
{
    ApplicationArea = All;
    Caption = 'Demo Apii Page';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = PisalesDashboardDemo;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ResponseCName; Rec.ResponseCName)
                {
                    ToolTip = 'Specifies the value of the ResponseCName field.', Comment = '%';
                }
                field(ResponseCustName; Rec.ResponseCustName)
                {
                    ToolTip = 'Specifies the value of the ResponseCustName field.', Comment = '%';
                }
                field(ResponseDocNo; Rec.ResponseDocNo)
                {
                    ToolTip = 'Specifies the value of the ResponseDocNo field.', Comment = '%';
                }
                field(ResponseEntryNo; Rec.ResponseEntryNo)
                {
                    ToolTip = 'Specifies the value of the ResponseEntryNo field.', Comment = '%';
                }
                field(ResponsePstDate; Rec.ResponsePstDate)
                {
                    ToolTip = 'Specifies the value of the ResponsePstDate field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetData)
            {
                Caption = 'Get Sales Data';
                Image = DataEntry;
                trigger onAction()
                var
                    Apis: Codeunit Apis;
                begin
                    Apis.GetRecords();
                end;
            }
            action(PostRecords)
            {
                Caption = 'Post Sales Data';
                Image = DataEntry;
                trigger onAction()
                var
                    Apis: Codeunit Apis;
                begin
                    Apis.PostRecords();
                end;
            }
            action(UpdateRecords)
            {
                Caption = 'Update Sales Data';
                Image = UpdateDescription;
                trigger onAction()
                var
                    Apis: Codeunit Apis;
                begin
                    Apis.UpdateRecords(Rec);
                end;
            }
            action(DeleteRecords)
            {
                Caption = 'Delete Sales Data';
                Image = Delete;
                trigger onAction()
                var
                    Apis: Codeunit Apis;
                begin
                    Apis.DeleteRecords(Rec);
                end;
            }
        }
        area(promoted)
        {
            actionref(get_ref; GetData) { }
            actionref(post_ref; PostRecords) { }
            actionref(update_ref; UpdateRecords) { }
            actionref(delete_ref; DeleteRecords) { }
        }
    }
}
