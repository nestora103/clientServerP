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

{обработка исключени€ при подключении к серверу}
procedure TForm1.csError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
 //подкл. не удалось
 if ErrorEvent= eeConnect  then
 begin
  //не отправл€ем серверу ничего
  cs.Active:=false;
  {добавление записи в журнал}
  mydate:=Now;
  //
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.lines.Add(formattedDateTime+': Ќевозможно установить соединение с сервером - '+cs.Address);
 end;
 ErrorCode:=0;
end;

{обработка подключени€ к серверу}
procedure TForm1.csConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  mydate:=Now;
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.lines.Add(formattedDateTime+': —оединение с сервером - '+socket.RemoteAddress+' установлено.');
end;

procedure TForm1.csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  //получение текущего времени
  mydate:=Now;
  //подгонка к строке
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.Lines.Add(formattedDateTime+': —оединение с сервером '+socket.RemoteAddress+' потер€но.');
end;

{ аждые 5 сек. пингуем сервер(провер€ем соединение) если его нет то устанавливаем}
procedure TForm1.teTimer(Sender: TObject);

begin
  //вкл. отправку
  if not cs.Active then
  begin
    cs.Active:=true;
  end;
  //пересылаем текст серверу
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
