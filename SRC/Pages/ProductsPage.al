
page 42116 "SDH Products"
{
    Caption = 'Products';
    PageType = List;
    DataCaptionFields = id, name;
    CardPageId = "SDH Product";
    SourceTable = "SDH Product Header";
    Editable = false;
    RefreshOnActivate = true;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                }
                field("Not Reserved"; Rec."Not Reserved")
                {
                    ToolTip = 'Specifies the value of the Not Reserved field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Delete)
            {
                ApplicationArea = All;
                Caption = 'Delete All';
                Promoted = true;
                PromotedCategory = Process;
                Image = DeleteAllBreakpoints;
                trigger OnAction()
                begin
                    if Confirm('Do you want to delete all record?') then
                        Rec.DeleteAllImported();
                end;
            }
        }
    }
}
