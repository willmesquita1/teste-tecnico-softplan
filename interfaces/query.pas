unit query;

interface

uses
 System.Classes;

type
    ['{3534085F-64EB-4BFC-94BB-AD72955F35C0}']
    IQuery = interface
       function GetColunas: TStringList;
       function GetTabelas: TStringList;
       function GetCondicoes: TStringList;
       function SetColunas(const AColunas: String): IQuery;
       function SetTabelas(const ATabelas: String): IQuery;
       function SetCondicoes(const ACondicoes: String): IQuery;
       function GeraSQL: String;
    end;

implementation

end.
