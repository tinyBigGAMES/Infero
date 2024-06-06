{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   ___         __
  |_ _| _ _   / _| ___  _ _  ___ ™
   | | | ' \ |  _|/ -_)| '_|/ _ \
  |___||_||_||_|  \___||_|  \___/
       LLM inference Library

Copyright © 2024-present tinyBigGAMES™ LLC
         All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com

See LICENSE file for license information
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * }

program testbed_pas;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Infero in '..\..\..\..\..\lib\Infero.pas',
  utestbed in '..\..\src\utestbed.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
