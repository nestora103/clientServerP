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

{Определние момента подключения клиентов}
procedure TForm1.ssClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  //получ. тек. время
  mydate:=Now;
  //подгоняем время под формат
  DateTimeToString(formattedDateTime, 'c', myDate);
  //выводим результата конекта в лог
  log.Lines.Add(formattedDateTime+': Соединение есть с '+Socket.RemoteAddress);
end;

{Определяем обработку сообщений от клиентов}
procedure TForm1.ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s:string;
begin
  //получаем текст с клиетна
  s:=Socket.ReceiveText;
  //выводим его в лог
  log.Lines.Add(s);
end;

{Отключение клиента, реакция}
procedure TForm1.ssClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  myDate : TDateTime;
  formattedDateTime : string;
begin
  mydate:=Now;
  DateTimeToString(formattedDateTime, 'c', myDate);
  log.Lines.Add(formattedDateTime+': клиент '+socket.RemoteAddress+' отключился.');
end;

procedure TForm1.ssClientWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
  Socket.SendText('Ответ');
end;

end.
