{***************************************************************************}
{                                                                           }
{ Delphi Runtime Library                                                    }
{                                                                           }
{ <auto-generated>                                                          }
{     This code was generated by a tool.                                    }
{     Def2Pas, version: 0.50                                                }
{     Copyright (C) 1995-2020, Yegor Mialyk. All Rights Reserved.           }
{                                                                           }
{     Changes to this file may cause incorrect behavior and will be lost if }
{     the code is regenerated.                                              }
{ </auto-generated>                                                         }
{                                                                           }
{ Licensed under the MIT License. See LICENSE for details.                  }
{                                                                           }
{***************************************************************************}

type
  ExtractProgressFunc = function (
    AHANDLE: THandle;
    A__int64: Int64
  ): Integer; stdcall;

type
  PExtractProcessCallbacks = ^ExtractProcessCallbacks;
  ExtractProcessCallbacks = record
    signalContext: THandle;
    FileProgress: ExtractProgressFunc;
  end;

const
  ACTUAL_API_VERSION = 6;
  STORAGE_FORMAT_NAME_MAX_LEN = 32;
  STORAGE_PARAM_MAX_LEN = 64;

type
  PStorageGeneralInfo = ^StorageGeneralInfo;
  StorageGeneralInfo = record
    Format: array [0..STORAGE_FORMAT_NAME_MAX_LEN - 1] of Char;
    Compression: array [0..STORAGE_PARAM_MAX_LEN - 1] of Char;
    Comment: array [0..STORAGE_PARAM_MAX_LEN - 1] of Char;
    Created: FILETIME;
  end;

type
  PStorageOpenParams = ^StorageOpenParams;
  StorageOpenParams = record
    StructSize: UIntPtr;
    FilePath: PChar;
    Password: PAnsiChar;
    Data: Pointer;
    DataSize: UIntPtr;
  end;

type
  PStorageItemInfo = ^StorageItemInfo;
  StorageItemInfo = record
    Size: Int64;
    PackedSize: Int64;
    Attributes: DWORD;
    CreationTime: FILETIME;
    ModificationTime: FILETIME;
    NumHardlinks: WORD;
    Owner: array [0..63] of Char;
    Path: array [0..1023] of Char;
  end;

type
  PExtractOperationParams = ^ExtractOperationParams;
  ExtractOperationParams = record
    ItemIndex: Integer;
    Flags: Integer;
    DestPath: PChar;
    Password: PAnsiChar;
    Callbacks: ExtractProcessCallbacks;
  end;

type
  OpenStorageFunc = function (
    params: StorageOpenParams;
    storage: PHandle;
    info: PStorageGeneralInfo
  ): Integer; stdcall;

type
  PrepareFilesFunc = function (
    storage: THandle
  ): Integer; stdcall;

type
  CloseStorageFunc = procedure (
    storage: THandle
  ); stdcall;

type
  GetItemFunc = function (
    storage: THandle;
    item_index: Integer;
    item_info: PStorageItemInfo
  ): Integer; stdcall;

type
  ExtractFunc = function (
    storage: THandle;
    params: ExtractOperationParams
  ): Integer; stdcall;

type
  Pmodule_cbs = ^module_cbs;
  module_cbs = record
    OpenStorage: OpenStorageFunc;
    CloseStorage: CloseStorageFunc;
    GetItem: GetItemFunc;
    ExtractItem: ExtractFunc;
    PrepareFiles: PrepareFilesFunc;
  end;

type
  PModuleLoadParameters = ^ModuleLoadParameters;
  ModuleLoadParameters = record
    StructSize: UIntPtr;
    Settings: PChar;
    ModuleId: TGUID;
    ModuleVersion: DWORD;
    ApiVersion: DWORD;
    ApiFuncs: module_cbs;
  end;

type
  LoadSubModuleFunc = function (
    AModuleLoadParameters: PModuleLoadParameters
  ): Integer; stdcall;

type
  UnloadSubModuleFunc = procedure (
  ); stdcall;

const
  SOR_INVALID_FILE = 0;
  SOR_SUCCESS = 1;
  SOR_PASSWORD_REQUIRED = 2;
  GET_ITEM_ERROR = 0;
  GET_ITEM_OK = 1;
  GET_ITEM_NOMOREITEMS = 2;
  SER_SUCCESS = 0;
  SER_ERROR_WRITE = 1;
  SER_ERROR_READ = 2;
  SER_ERROR_SYSTEM = 3;
  SER_USERABORT = 4;
  SER_PASSWORD_REQUIRED = 5;
