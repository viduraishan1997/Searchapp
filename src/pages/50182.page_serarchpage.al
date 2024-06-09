page 50182 "Search Page"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Search Results";
    SourceTableTemporary = true;
    UsageCategory = Tasks;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(SearchGroup)
            {
                Caption = 'Search Group';
                field(SearchText; SearchText)
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    var
                        SearchMgt: Codeunit "Search Management";
                    begin
                        SearchMgt.SearchTest(SearchText, Rec);
                    end;
                }
            }
            repeater(General)
            {
                field("Data Caption"; Rec."Data Caption")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        SearchMgt: Codeunit "Search Management";
                    begin
                        SearchMgt.Navigate(Rec);
                    end;
                }
                field("Table Name"; Rec."Table Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Setup)
            {
                Caption = 'Setup';
                ApplicationArea = All;
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "Search Tables";
            }
        }
    }
    var
        SearchText: Text;
}