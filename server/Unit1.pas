unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    ss: TServerSocket;
    log: TMemo;
    procedure logChange(Sender: TObject);
    procedure ssClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ssClientWrite(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.logChange(Sender: TObject);
begin

end;

{���������� ������� ����������� ��������}
procedure TForm1.ssClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  //�����. ���. �����
  mydate:=Now;
  //��������� ����� ��� ������
  DateTimeToString(formattedDateTime, 'c', myDate);
  //������� ���������� ������� � ���
  log.Lines.Add(formattedDateTime+': ���������� ���� � '+Socket.RemoteAddress);
end;

{���������� ��������� ��������� �� ��������}
procedure TForm1.ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s:string;
begin
  //�������� ����� � �������
  s:=Socket.ReceiveText;
  //������� ��� � ���
  log.Lines.Add(s);
end;

{���������� �������, �������}
procedure TForm1.ssClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  mydate:=Now;
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.Lines.Add(formattedDateTime+': ������ '+socket.RemoteAddress+' ����������.');
end;

procedure TForm1.ssClientWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
  Socket.SendText('�����');
end;

end.
