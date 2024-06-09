table 50182 "Search Results"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No';
            DataClassification = SystemMetadata;
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No';
            DataClassification = SystemMetadata;
        }
        field(3; "Table Name"; Text[50])
        {
            Caption = 'Tabel Name';
            FieldClass = FlowField;
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = const(Table), "Object Id" = field("Table No.")));
        }
        field(4; "Record Id"; RecordId)
        {
            DataClassification = SystemMetadata;
        }
        field(5; "Data Caption"; Text[250])
        {
            Caption = 'Data Caption';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }
}