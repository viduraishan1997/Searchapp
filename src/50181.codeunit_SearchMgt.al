codeunit 50181 "Search Management"
{
    procedure SearchTest(SearchTearm: Text; var SearchResults: Record "Search Results" temporary)
    var
        SearchSetup: Record "Search Setup";
        CountValue: Integer;
        RecRef: RecordRef;
        KeyRef: KeyRef;
        FildRef: FieldRef;
        OnlyOneFieldPrimaryKeyErro: Label 'Primary Key search is only support on tables with field in the key';
    begin
        if SearchSetup.FindSet() then
            repeat
                RecRef.Open(SearchSetup."Table No.");
                if SearchSetup."Search Primary Key" then begin
                    KeyRef := RecRef.KeyIndex(1);
                    if KeyRef.FieldCount <> 1 then
                        Error(OnlyOneFieldPrimaryKeyErro);
                    FildRef := KeyRef.FieldIndex(1);
                    FildRef.SetRange(SearchTearm);
                    if RecRef.FindFirst() then begin
                        CountValue += 1;
                        SearchResults.Init();
                        SearchResults."Line No." := CountValue;
                        SearchResults."Table No." := SearchSetup."Table No.";
                        SearchResults."Data Caption" := CopyStr(DataCaption(RecRef), 1, MaxStrLen(SearchResults."Data Caption"));
                        SearchResults."Record Id" := RecRef.RecordId;
                        SearchResults.Insert();
                    end;
                end;
                RecRef.Close();
            until SearchSetup.Next() = 0;
    end;

    procedure DataCaption(Ref: RecordRef): Text
    var
        i: Integer;
        FRef: FieldRef;
        Result: Text;
    begin
        for i := 1 to Ref.KeyIndex(1).FieldCount() do begin
            FRef := Ref.FieldIndex(i);
            if Result <> '' then
                Result += '' + Format(FRef.Value())
            else
                Result += Format(FRef.Value());
        end;
        exit(Result);
    end;

    procedure Navigate(SearchResults: Record "Search Results")
    var
        SearchSetup: Record "Search Setup";
        RecRef: RecordRef;
        RefVar: Variant;
    begin
        SearchSetup.Get(SearchResults."Table No.");
        SearchSetup.TestField("Card Page");
        RecRef.Open(SearchSetup."Table No.");
        RefVar := RecRef;
        RecRef.Get(SearchResults."Record Id");
        Page.Run(SearchSetup."Card Page", RefVar);
        RecRef.Close();

    end;

}