table 42110 PisalesDashboardDemo
{
    Caption = 'PisalesDashboardDemo';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; ResponseCName; Text[250])
        {
            Caption = 'ResponseCName';
        }
        field(2; ResponsePstDate; Date)
        {
            Caption = 'ResponsePstDate';
        }
        field(3; ResponseCustName; Text[250])
        {
            Caption = 'ResponseCustName';
        }
        field(4; ResponseEntryNo; Integer)
        {
            Caption = 'ResponseEntryNo';
        }
        field(5; ResponseDocNo; Code[20])
        {
            Caption = 'ResponseDocNo';
        }
    }
    keys
    {
        key(PK; ResponseEntryNo)
        {
            Clustered = true;
        }
    }
}
