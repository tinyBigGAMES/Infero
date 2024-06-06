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

unit Infero.Export;

{$I Infero.Defines.inc}

interface

uses
  Infero.LLaMA,
  Infero.Utils,
  Infero.Core;

//=== UTILS =================================================================
procedure Print(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external 'llama.dll' name 'Print'; exports Print;
procedure PrintLn(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external 'llama.dll' name 'PrintLn'; exports PrintLn;

procedure GetCursorPos(X, Y: PInteger); cdecl; exports GetCursorPos;
procedure SetCursorPos(const X, Y: Integer); cdecl; exports SetCursorPos;
procedure ClearConsole(); cdecl; exports ClearConsole;
procedure ClearConsoleLine(const AColor: WORD); cdecl; exports ClearConsoleLine;

procedure ClearKeyStates(); cdecl; exports ClearKeyStates;
function  IsKeyPressed(AKey: Byte): Boolean; cdecl; exports IsKeyPressed;
function  WasKeyReleased(AKey: Byte): Boolean; cdecl; exports WasKeyReleased;
function  WasKeyPressed(AKey: Byte): Boolean; cdecl; exports WasKeyPressed;
procedure Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar); cdecl; exports Pause;

procedure ProcessMessages(); cdecl; exports ProcessMessages;
function  MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar; cdecl; exports MaskFirstFoundWord;

procedure SetTokenResponseRightMargin(const AMargin: Integer); cdecl; exports SetTokenResponseRightMargin;
function  AddTokenResponseToken(const AToken: PWideChar): Integer; cdecl; exports AddTokenResponseToken;
function  LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar; cdecl; exports LastTokenResponseWord;
function  FinalizeTokenResponse(): Boolean; cdecl; exports FinalizeTokenResponse;


//=== SPEECH =================================================================
procedure SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer); cdecl; exports SetSpeechWordCallback;
function  GetSpeechWordCallback(): Speech.WordEvent; cdecl; exports GetSpeechWordCallback;
function  GetSpeechVoiceCount(): Integer; cdecl; exports GetSpeechVoiceCount;
function  GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar; cdecl; exports GetSpeechVoiceAttribute;
procedure ChangeSpeechVoice(const AIndex: Integer); cdecl; exports ChangeSpeechVoice;
function  GetSpeechVoice(): Integer; cdecl; exports GetSpeechVoice;
procedure SetSpeechVolume(const AVolume: Single); cdecl; exports SetSpeechVolume;
function  GetSpeechVolume(): Single; cdecl; exports GetSpeechVolume;
procedure SetSpeechRate(const ARate: Single); cdecl; exports SetSpeechRate;
function  GetSpeechRate(): Single; cdecl; exports GetSpeechRate;
procedure ClearSpeech(); cdecl; exports ClearSpeech;
procedure SaySpeech(const AText: PWideChar; const APurge: Boolean); cdecl; exports SaySpeech;
function  IsSpeechActive(): Boolean; cdecl; exports IsSpeechActive;
procedure PauseSpeech(); cdecl; exports PauseSpeech;
procedure ResumeSpeech(); cdecl; exports ResumeSpeech;
procedure ResetSpeech(); cdecl; exports ResetSpeech;
procedure SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar); cdecl; exports SubstituteSpeechWord;


//=== CORE ===================================================================
function  GetVersionInfo(const AType: Byte): PWideChar; cdecl; exports GetVersionInfo;

procedure ClearError(); cdecl; exports ClearError;
procedure SetError(const AText: PWideChar); cdecl; exports SetError;
function  GetError(): PWideChar; cdecl; exports GetError;

function  GetInferenceCancelCallback(): TInfero.InferenceCancelCallback; cdecl; exports GetInferenceCancelCallback;
procedure SetInferenceCancelCallback(const AHandler: TInfero.InferenceCancelCallback; const AUserData: Pointer); cdecl; exports SetInferenceCancelCallback;

function  GetInferenceTokenCallback(): TInfero.InferenceTokenCallback; cdecl; exports GetInferenceTokenCallback;
procedure SetInferenceTokenlCallback(const AHandler: TInfero.InferenceTokenCallback; const AUserData: Pointer); cdecl; exports SetInferenceTokenlCallback;

function  GetInfoCallback(): TInfero.InfoCallback; cdecl; exports GetInfoCallback;
procedure SetInfoCallback(const AHandler: TInfero.InfoCallback; const AUserData: Pointer); cdecl; exports SetInfoCallback;

function  GetLoadModelProgressCallback(): TInfero.LoadModelProgressCallback; cdecl; exports GetLoadModelProgressCallback;
procedure SetLoadModelProgressCallback(const AHandler: TInfero.LoadModelProgressCallback; const AUserData: Pointer); cdecl; exports SetLoadModelProgressCallback;

function  GetLoadModelCallback(): TInfero.LoadModelCallback; cdecl; exports GetLoadModelCallback;
procedure SetLoadModelCallback(const AHandler: TInfero.LoadModelCallback; const AUserData: Pointer); cdecl; exports SetLoadModelCallback;

function  GetInferenceStartCallback(): TInfero.InferenceStartCallback; cdecl; exports GetInferenceStartCallback;
procedure SetInferenceStartCallback(const AHandler: TInfero.InferenceStartCallback; const AUserData: Pointer); cdecl; exports SetInferenceStartCallback;

function  GetInferenceEndCallback(): TInfero.InferenceEndCallback; cdecl; exports GetInferenceEndCallback;
procedure SetInferenceEndCallback(const AHandler: TInfero.InferenceEndCallback; const AUserData: Pointer); cdecl; exports SetInferenceEndCallback;

procedure InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32); cdecl; exports InitConfig;
function  SaveConfig(const AFilename: PWideChar): Boolean; cdecl; exports SaveConfig;
function  LoadConfig(const AFilename: PWideChar): Boolean; cdecl; exports LoadConfig;

procedure ClearAllMessages(); cdecl; exports ClearAllMessages;
function  AddMessage(const ARole, AContent: PWideChar): Int32; cdecl; exports AddMessage;
function  GetLastUserMessage(): PWideChar; cdecl; exports GetLastUserMessage;
function  BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar; cdecl; exports BuildMessageInferencePrompt;

procedure ClearModelDefines(); cdecl; exports ClearModelDefines;
function  DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32; cdecl; exports DefineModel;
function  SaveModelDefines(const AFilename: PWideChar): Boolean; cdecl; exports SaveModelDefines;
function  LoadModelDefines(const AFilename: PWideChar): Boolean; cdecl; exports LoadModelDefines;

function  LoadModel(const AModelName: PWideChar): Boolean; cdecl; exports LoadModel;
function  IsModelLoaded(): Boolean; cdecl; exports IsModelLoaded;
procedure UnloadModel(); cdecl; exports UnloadModel;

function  RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean; cdecl; exports RunInference;
function  GetInferenceResponse(): PWideChar; cdecl; exports GetInferenceResponse;
procedure GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32); cdecl; exports GetInferenceStats;


implementation

var
  LInfero: TInfero = nil;


//=== UTILS =================================================================


procedure GetCursorPos(X, Y: PInteger);
begin
  LInfero.GetCursorPos(X, Y);
end;

procedure SetCursorPos(const X, Y: Integer);
begin
  LInfero.SetCursorPos(X, Y);
end;

procedure ClearConsole();
begin
  LInfero.ClearConsole();
end;

procedure ClearConsoleLine(const AColor: WORD);
begin
  LInfero.ClearConsoleLine(AColor);
end;

procedure ClearKeyStates();
begin
  LInfero.ClearKeyStates();
end;

function  IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := LInfero.IsKeyPressed(AKey);
end;

function  WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := LInfero.WasKeyReleased(AKey);
end;

function  WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := LInfero.WasKeyPressed(AKey);
end;

procedure Pause(const AForcePause: Boolean; AColor: WORD; const AText: PWideChar);
begin
  LInfero.Pause(AForcePause, AColor, AText);
end;

procedure ProcessMessages();
begin
  LInfero.ProcessMessages();
end;

function  MaskFirstFoundWord(const AText, AWord: PWideChar): PWideChar;
begin
  Result := PWideChar(LInfero.MaskFirstFoundWord(AText, AWord));
end;

procedure SetTokenResponseRightMargin(const AMargin: Integer);
begin
  LInfero.SetTokenResponseRightMargin(AMargin);
end;

function  AddTokenResponseToken(const AToken: PWideChar): Integer;
begin
  Result := LInfero.AddTokenResponseToken(AToken);
end;

function  LastTokenResponseWord(const ATrimLeft: Boolean): PWideChar;
begin
  Result := PWideChar(LInfero.LastTokenResponseWord(ATrimLeft));
end;

function  FinalizeTokenResponse(): Boolean;
begin
  Result := LInfero.FinalizeTokenResponse();
end;



//=== SPEECH =================================================================
procedure SetSpeechWordCallback(const AHandler: Speech.WordEvent; const AUserData: Pointer);
begin
  Speech.SetOnWordEvent(AHandler, AUserData)
end;

function  GetSpeechWordCallback(): Speech.WordEvent;
begin
  Result := Speech.GetOnWordEvent();
end;

function  GetSpeechVoiceCount(): Integer;
begin
  Result := Speech.GetVoiceCount();
end;

function  GetSpeechVoiceAttribute(const AIndex: Integer; const AAttribute: Speech.VoiceAttributeEvent): PWideChar;
begin
  Result := PWideChar(Speech.GetVoiceAttribute(AIndex, AAttribute));
end;

procedure ChangeSpeechVoice(const AIndex: Integer);
begin
  Speech.ChangeVoice(AIndex);
end;

function  GetSpeechVoice(): Integer;
begin
  Result := Speech.GetVoice();
end;

procedure SetSpeechVolume(const AVolume: Single);
begin
  Speech.SetVolume(AVolume);
end;

function  GetSpeechVolume(): Single;
begin
  Result := Speech.GetVolume();
end;

procedure SetSpeechRate(const ARate: Single);
begin
  Speech.SetRate(ARate);
end;

function  GetSpeechRate(): Single;
begin
  Result := Speech.GetRate();
end;

procedure ClearSpeech();
begin
  Speech.Clear();
end;

procedure SaySpeech(const AText: PWideChar; const APurge: Boolean);
begin
  Speech.Say(string(AText), APurge)
end;

function  IsSpeechActive(): Boolean;
begin
  Result := Speech.Active();
end;

procedure PauseSpeech();
begin
  Speech.Pause();
end;

procedure ResumeSpeech();
begin
  Speech.Resume();
end;

procedure ResetSpeech();
begin
  Speech.Reset();
end;

procedure SubstituteSpeechWord(const AWord, ASubstituteWord: PWideChar);
begin
  Speech.SubstituteWord(string(AWord), string(ASubstituteWord));
end;

//=== CORE ==================================================================
function  GetVersionInfo(const AType: Byte): PWideChar;
begin
  Result := PWideChar(LInfero.GetVersion(AType));
end;

procedure ClearError();
begin
  LInfero.ClearError();
end;

procedure SetError(const AText: PWideChar);
begin
  LInfero.SetError(string(AText));
end;

function  GetError(): PWideChar;
begin
  Result := PWideChar(LInfero.GetError());
end;

function  GetInferenceCancelCallback(): TInfero.InferenceCancelCallback;
begin
  Result := LInfero.GetInferenceCancelCallback();
end;

procedure SetInferenceCancelCallback(const AHandler: TInfero.InferenceCancelCallback; const AUserData: Pointer);
begin
  LInfero.SetInferenceCancelCallback(AHandler, AUserData);
end;

function  GetInferenceTokenCallback(): TInfero.InferenceTokenCallback;
begin
  Result := LInfero.GetInferenceTokenCallback();
end;

procedure SetInferenceTokenlCallback(const AHandler: TInfero.InferenceTokenCallback; const AUserData: Pointer);
begin
  LInfero.SetInferenceTokenlCallback(AHandler, AUserData);
end;

function  GetInfoCallback(): TInfero.InfoCallback;
begin
  Result := LInfero.GetInfoCallback();
end;

procedure SetInfoCallback(const AHandler: TInfero.InfoCallback; const AUserData: Pointer);
begin
  LInfero.SetInfoCallback(AHandler, AUserData);
end;

function  GetLoadModelProgressCallback(): TInfero.LoadModelProgressCallback;
begin
  Result := LInfero.GetLoadModelProgressCallback();
end;

procedure SetLoadModelProgressCallback(const AHandler: TInfero.LoadModelProgressCallback; const AUserData: Pointer);
begin
  LInfero.SetLoadModelProgressCallback(AHandler, AUserData);
end;

function  GetLoadModelCallback(): TInfero.LoadModelCallback;
begin
  Result := LInfero.GetLoadModelCallback();
end;

procedure SetLoadModelCallback(const AHandler: TInfero.LoadModelCallback; const AUserData: Pointer);
begin
  LInfero.SetLoadModelCallback(AHandler, AUserData);
end;

function  GetInferenceStartCallback(): TInfero.InferenceStartCallback;
begin
  Result := LInfero.GetInferenceStartCallback();
end;

procedure SetInferenceStartCallback(const AHandler: TInfero.InferenceStartCallback; const AUserData: Pointer);
begin
  LInfero.SetInferenceStartCallback(AHandler, AUserData);
end;

function  GetInferenceEndCallback(): TInfero.InferenceEndCallback;
begin
  Result := LInfero.GetInferenceEndCallback();
end;

procedure SetInferenceEndCallback(const AHandler: TInfero.InferenceEndCallback; const AUserData: Pointer);
begin
  LInfero.SetInferenceEndCallback(AHandler, AUserData);
end;

procedure InitConfig(const AModelPath: PWideChar; const ANumGPULayers: Int32);
begin
  LInfero.InitConfig(string(AModelPath), ANumGPULayers)
end;

function  SaveConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LInfero.SaveConfig(string(AFilename));
end;

function  LoadConfig(const AFilename: PWideChar): Boolean;
begin
  Result := LInfero.LoadConfig(string(AFilename));
end;

procedure ClearAllMessages();
begin
  LInfero.ClearAllMessages();
end;

function  AddMessage(const ARole, AContent: PWideChar): Int32;
begin
  Result := LInfero.AddMessage(string(ARole), string(AContent));
end;

function  GetLastUserMessage(): PWideChar;
begin
  Result := PWideChar(LInfero.GetLastUserMessage());
end;

function  BuildMessageInferencePrompt(const AModelName: PWideChar): PWideChar;
begin
  Result := PWideChar(LInfero.BuildMessageInferencePrompt(AModelName));
end;

procedure ClearModelDefines();
begin
  LInfero.ClearModelDefines();
end;

function  DefineModel(const AModelFilename, AModelName: PWideChar; const AMaxContext: UInt32; const ATemplate, ATemplateEnd: PWideChar): Int32;
begin
  Result := LInfero.DefineModel(string(AModelFilename), string(AModelName), AMaxContext, string(ATemplate), string(ATemplateEnd));
end;

function  SaveModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LInfero.SaveModelDefines(string(AFilename));
end;

function  LoadModelDefines(const AFilename: PWideChar): Boolean;
begin
  Result := LInfero.LoadModelDefines(string(AFilename));
end;

function  LoadModel(const AModelName: PWideChar): Boolean;
begin
  Result := LInfero.LoadModel(string(AModelName));
end;

function  IsModelLoaded(): Boolean;
begin
  Result := LInfero.IsModelLoaded();
end;

procedure UnloadModel();
begin
  LInfero.UnloadModel();
end;

function  RunInference(const AModelName: PWideChar; const AMaxTokens: UInt32): Boolean;
begin
  Result := LInfero.RunInference(string(AModelName), AMaxTokens);
end;

function  GetInferenceResponse(): PWideChar;
begin
  Result := PWideChar(LInfero.GetInferenceResponse());
end;

procedure GetInferenceStats(ATokenInputSpeed: PSingle; ATokenOutputSpeed: PSingle; AInputTokens: PInt32; AOutputTokens: PInt32; ATotalTokens: PInt32);
begin
  LInfero.GetInferenceStats(ATokenInputSpeed, ATokenOutputSpeed, AInputTokens, AOutputTokens, ATotalTokens);
end;


{ --------------------------------------------------------------------------- }
initialization
begin
  LInfero := TInfero.Create();
end;

finalization
begin
  LInfero.Free();
end;

end.
