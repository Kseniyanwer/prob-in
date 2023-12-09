unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, jpeg, ExtCtrls, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Res:Double;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  ResultVolume, Radius: Double;

  function CalculatingVolume(X, Y: Double): Double;
  begin
    Result := Exp(Y * Ln(X));
  end;

begin
  try
    Radius := StrToFloat(Edit1.Text);

    if Radius < 0 then
    begin
      Label3.Caption := 'Please try another number, which is greater than 0.';
      Edit1.Text := '';
    end
    else if Radius = 0 then
    begin
      Edit2.Text := '0';
      Label3.Caption := '';
    end
    else
    begin
      Res:=0;
      Res:= Res + (((4 / 3) * Pi * CalculatingVolume(Radius, 3)));
      Edit2.Text :=  FloatToStr(Res);
      Label3.Caption := '';
      Width:=600;
      Height:=400;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Close;
end;

end.

