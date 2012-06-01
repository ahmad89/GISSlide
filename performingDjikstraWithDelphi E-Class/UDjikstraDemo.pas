unit UDjikstraDemo;

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
    name : string;   // name of the node (e.g: matos, a, b etc)
    distance : real; // best distance so far, default 0
    from : integer;  // index of the "from node", default -1
  end;

var
  Form1: TForm1;
  Nodes : array[1..5] of TNode; // nodes
  Matriks : array[1..5] of array[1..5] of real;

implementation

{$R *.dfm}
//just to make life easier
procedure cetak(sesuatu: string);
begin
  Form1.Memo1.Lines.Add(sesuatu);
end;

procedure traverse(currentNodeIndex : integer);
var
  i,j : integer;
begin
  // for every node that can be visited from the current node
  //   updates their distance and from
  for i := 1 to 5 do
  begin
    if Matriks[currentNodeIndex][i]>0 then
    begin
      // update node.distance and node.from
      nodes[i].distance := Matriks[currentNodeIndex][i];
      nodes[i].from := currentNodeIndex;
    end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i, j : integer;
begin
  // define the nodes
  //initiate default values for each nodes
  for i := 1 to 5 do
  begin
    nodes[i].distance := 0;
    nodes[i].from := -1; // -1 means not evaluated yet
  end;
  nodes[1].name := 'A'; nodes[2].name := 'B';
  nodes[3].name := 'C'; nodes[4].name := 'D';
  nodes[5].name := 'E';
  
  // define the matrix
  //fill each element with zero
  for i := 1 to 5 do
    for j := 1 to 5 do
      Matriks[i][j] := 0;
  //fill the non-zero elements with it value
  Matriks[1][2] := 3; Matriks[1][5] := 1; Matriks[2][4] := 2;
  Matriks[3][1] := 4; Matriks[3][2] := 2; Matriks[3][5] := 5;
  Matriks[4][3] := 6; Matriks[4][5] := 1; Matriks[5][1] := 1;
  Matriks[5][4] := 3;


  //do the action
  traverse(1);

  //show up the result
  for i := 1 to 5 do
  begin
    if nodes[i].from > -1 then
    begin
      cetak('From '+nodes[nodes[i].from].name+
        ' to '+nodes[i].name+
        ' , distance = '+FloatToStr(nodes[i].distance));
    end;
  end;

end;

end.
 