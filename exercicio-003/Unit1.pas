unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

type
  TGlobalVar = class
    private
      username: string;
      syslog: TStringList;

    public
      constructor Create;
      procedure setUserName(Name: String);
      function getUserName: String;
      procedure addLog(Desc: String);
      function getSystemLog: TStrings;
      function closeSystemLog: integer;
  end;

implementation

// Constructor
constructor TGlobalVar.Create;
begin
  Self.syslog := TStringList.Create;

  // Load log file
  Self.syslog.LoadFromFile('log.txt');

end;

// Set Username
procedure TGlobalVar.setUserName(Name: String);
begin
  Self.username := Name;
end;

// Get Username
function TGlobalVar.getUserName;
begin
  Result := Self.username;
end;

// Add log
procedure TGlobalVar.addLog(Desc: String);
begin
  Self.syslog.Add( DateToStr(date) + ' ' + TimeToStr(time) + ' | ' + getUserName + ' | ' +Desc);
end;

// Get system log
function TGlobalVar.getSystemLog;
begin
  Result := Self.syslog;
end;

// CLose system log
function TGlobalVar.closeSystemLog;
begin

  // Save log to file
  Self.syslog.SaveToFile('log.txt');

  Result := 1;

end;

end.
