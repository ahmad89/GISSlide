unit UDemoDjikstra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TNode = record
    name : string;   // '' by default, (e.g : 'A', 'B', 'Matos')
    from : integer;  // -1 by default
    distance : real; // 0 by default
    evaluated : boolean; // false by default
  end;

var
  Form1: TForm1;
  Matriks : array[1..5, 1..5] of real;
  Nodes : array[1..5] of TNode;

implementation

{$R *.dfm}

//not a big deal, just make your life easier
procedure cetak(sesuatu : string);
begin
  Form1.Memo1.Lines.Add(sesuatu);
end;

//our djikstra process (hint : this should be modified
//into recursive function
procedure traverse(CurrentNodeIndex : integer);
var
  i : integer;
begin
  //mark currentNode as evaluated
  Nodes[CurrentNodeIndex].evaluated := true;

  //for each nodes that can be visited from CurrentNode
  for i := 1 to 5 do
  begin
    if matriks[CurrentNodeIndex, i]>0 then
    begin
      //update the respective node's distance and from
      Nodes[i].from := CurrentNodeIndex;
      Nodes[i].distance := Matriks[CurrentNodeIndex, i] +
        Nodes[CurrentNodeIndex].distance;
    end;
  end;
end;


procedure TForm1.FormShow(Sender: TObject);
var
  i,j : integer;
begin
  // initialize matriks
  for i := 1 to 5 do
    for j := 1 to 5 do
      matriks[i,j] := 0;
  matriks[1,2] := 3; matriks [1,5] := 1; matriks[2,4] := 2;
  matriks[3,2] := 4; matriks [3,2] := 2; matriks[3,5] := 5;
  matriks[4,3] := 6; matriks [4,5] := 1; matriks[5,1] := 1;
  matriks[5,4] := 3;

  // initialize nodes
  for i := 1 to 5 do
  begin
    nodes[i].name := '';
    nodes[i].from := -1;
    nodes[i].distance := 0;
    nodes[i].evaluated := false;
  end;
  nodes[1].name := 'A'; nodes[2].name := 'B';
  nodes[3].name := 'C'; nodes[4].name := 'D';
  nodes[5].name := 'E';


  //the fun begin
  traverse(1);

  //print the result out
  for i := 1 to 5 do
  begin
    if nodes[i].from>-1 then
    begin
      cetak('From Node '+nodes[nodes[i].from].name+
        ' to Node '+nodes[i].name+
        ', distance = '+FloatToStr(nodes[i].distance))
    end;
  end;

end;

end.
 