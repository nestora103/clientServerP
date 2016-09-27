unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ScktComp;

type
  TForm1 = class(TForm)
    cs: TClientSocket;
    te: TTimer;
    log: TMemo;
    procedure csError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure teTimer(Sender: TObject);
    procedure csRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{��������� ���������� ��� ����������� � �������}
procedure TForm1.csError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
 //�����. �� �������
 if ErrorEvent= eeConnect  then
 begin
  //�� ���������� ������� ������
  cs.Active:=false;
  {���������� ������ � ������}
  mydate:=Now;
  //
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.lines.Add(formattedDateTime+': ���������� ���������� ���������� � �������� - '+cs.Address);
 end;
 ErrorCode:=0;
end;

{��������� ����������� � �������}
procedure TForm1.csConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  mydate:=Now;
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.lines.Add(formattedDateTime+': ���������� � �������� - '+socket.RemoteAddress+' �����������.');
end;

procedure TForm1.csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  //��������� �������� �������
  mydate:=Now;
  //�������� � ������
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.Lines.Add(formattedDateTime+': ���������� � �������� '+socket.RemoteAddress+' ��������.');
end;

{������ 5 ���. ������� ������(��������� ����������) ���� ��� ��� �� �������������}
procedure TForm1.teTimer(Sender: TObject);

begin
  //���. ��������
  if not cs.Active then
  begin
    cs.Active:=true;
  end;
  //���������� ����� �������
  cs.Socket.SendText('Ping client');
end;

procedure TForm1.csRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s:string;
begin
  s:=cs.Socket.ReceiveText;
  log.Lines.Add(s);
end;

end.
