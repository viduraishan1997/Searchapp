page 50181 "Search Tables"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Search Setup";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            repeater(RepeaterGroup)
            {
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = All;
                }
                field("Search Primary Key"; Rec."Search Primary Key")
                {
                    ApplicationArea = All;
                }
                field("Full Text Search"; Rec."Full Text Search")
                {
                    ApplicationArea = All;
                }
                field("Card Page"; Rec."Card Page")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}