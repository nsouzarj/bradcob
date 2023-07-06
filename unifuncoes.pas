unit UniFuncoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

  { Func }

  TFunc=class(TObject)

    function LPad(S: string; Ch: Char; Len: Integer):string;
    function RPad(S: string; Ch: Char; Len: Integer): string;
    public
    private
  end;
Var
  Func:TFunc;


implementation


{ Func }

function TFunc.LPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function TFunc.RPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

end.

