table 42114 ValuesTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;Code; Integer)
        {
            DataClassification = ToBeClassified;
            Caption= 'Code';
            AutoIncrement = true;
            
        }
           field(2;Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption= 'Description';
            
            
        }
           field(3;Value; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption= 'Value';
            
            
        }
    }
    
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}