  (* This unit was generated using the script genTaurusTLSHdrs.sh from the source file TaurusTLSHeaders_buffererr.h2pas
     It should not be modified directly. All changes should be made to TaurusTLSHeaders_buffererr.h2pas
     and this file regenerated. TaurusTLSHeaders_buffererr.h2pas is distributed with the full Indy
     Distribution.
   *)
   
{$i IdCompilerDefines.inc} 
{$i IdSSLTaurusTLSDefines.inc} 
{$IFNDEF USE_OPENSSL}
  { error Should not compile if USE_OPENSSL is not defined!!!}
{$ENDIF}
{******************************************************************************}
{                                                                              }
{            Indy (Internet Direct) - Internet Protocols Simplified            }
{                                                                              }
{            https://www.indyproject.org/                                      }
{            https://gitter.im/IndySockets/Indy                                }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  This file is part of the Indy (Internet Direct) project, and is offered     }
{  under the dual-licensing agreement described on the Indy website.           }
{  (https://www.indyproject.org/license/)                                      }
{                                                                              }
{  Copyright:                                                                  }
{   (c) 1993-2020, Chad Z. Hower and the Indy Pit Crew. All rights reserved.   }
{                                                                              }
{******************************************************************************}
{                                                                              }
{                                                                              }
{******************************************************************************}

unit TaurusTLSHeaders_buffererr;

interface

// Headers for TaurusTLS 1.1.1
// buffererr.h


uses
  IdCTypes,
  IdGlobal,
  IdSSLTaurusTLSConsts;

const
// BUF function codes.
  BUF_F_BUF_MEM_GROW = 100;
  BUF_F_BUF_MEM_GROW_CLEAN = 105;
  BUF_F_BUF_MEM_NEW = 101;

// BUF reason codes.

    { The EXTERNALSYM directive is ignored by FPC, however, it is used by Delphi as follows:
		
  	  The EXTERNALSYM directive prevents the specified Delphi symbol from appearing in header 
	  files generated for C++. }
	  
  {$EXTERNALSYM ERR_load_BUF_strings}

{$IFNDEF OPENSSL_STATIC_LINK_MODEL}
var
  ERR_load_BUF_strings: function : TIdC_INT; cdecl = nil;

{$ELSE}
  function ERR_load_BUF_strings: TIdC_INT cdecl; external CLibCrypto;

{$ENDIF}

implementation

  uses
    classes, 
    IdSSLTaurusTLSExceptionHandlers, 
    IdResourceStringsTaurusTLS
  {$IFNDEF OPENSSL_STATIC_LINK_MODEL}
    ,IdSSLTaurusTLSLoader
  {$ENDIF};
  

{$IFNDEF OPENSSL_STATIC_LINK_MODEL}
const
  ERR_load_BUF_strings_procname = 'ERR_load_BUF_strings';


{$WARN  NO_RETVAL OFF}
function  ERR_ERR_load_BUF_strings: TIdC_INT; 
begin
  EIdAPIFunctionNotPresent.RaiseException(ERR_load_BUF_strings_procname);
end;



{$WARN  NO_RETVAL ON}

procedure Load(const ADllHandle: TIdLibHandle; LibVersion: TIdC_UINT; const AFailed: TStringList);

var FuncLoadError: boolean;

begin
  ERR_load_BUF_strings := LoadLibFunction(ADllHandle, ERR_load_BUF_strings_procname);
  FuncLoadError := not assigned(ERR_load_BUF_strings);
  if FuncLoadError then
  begin
    {$if not defined(ERR_load_BUF_strings_allownil)}
    ERR_load_BUF_strings := @ERR_ERR_load_BUF_strings;
    {$ifend}
    {$if declared(ERR_load_BUF_strings_introduced)}
    if LibVersion < ERR_load_BUF_strings_introduced then
    begin
      {$if declared(FC_ERR_load_BUF_strings)}
      ERR_load_BUF_strings := @FC_ERR_load_BUF_strings;
      {$ifend}
      FuncLoadError := false;
    end;
    {$ifend}
    {$if declared(ERR_load_BUF_strings_removed)}
    if ERR_load_BUF_strings_removed <= LibVersion then
    begin
      {$if declared(_ERR_load_BUF_strings)}
      ERR_load_BUF_strings := @_ERR_load_BUF_strings;
      {$ifend}
      FuncLoadError := false;
    end;
    {$ifend}
    {$if not defined(ERR_load_BUF_strings_allownil)}
    if FuncLoadError then
      AFailed.Add('ERR_load_BUF_strings');
    {$ifend}
  end;


end;

procedure Unload;
begin
  ERR_load_BUF_strings := nil;
end;
{$ELSE}
{$ENDIF}

{$IFNDEF OPENSSL_STATIC_LINK_MODEL}
initialization
  Register_SSLLoader(@Load,'LibCrypto');
  Register_SSLUnloader(@Unload);
{$ENDIF}
end.
