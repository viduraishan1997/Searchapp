table 50181 "Search Setup"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Table No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
        }
        field(2; "Search Primary Key"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Full Text Search"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Card Page"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Page));
        }
    }
    keys
    {
        key(key1; "Table No.")
        {
            Clustered = true;
        }
    }
}
