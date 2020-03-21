LOCAL_PATH:= $(call my-dir)

# No dia support
debuginfo_pdb_SRC_FILES := \
  GenericError.cpp \
  IPDBSourceFile.cpp \
  PDB.cpp \
  PDBContext.cpp \
  PDBExtras.cpp \
  PDBInterfaceAnchors.cpp \
  PDBSymbol.cpp \
  PDBSymbolAnnotation.cpp \
  PDBSymbolBlock.cpp \
  PDBSymbolCompiland.cpp \
  PDBSymbolCompilandDetails.cpp \
  PDBSymbolCompilandEnv.cpp \
  PDBSymbolCustom.cpp \
  PDBSymbolData.cpp \
  PDBSymbolExe.cpp \
  PDBSymbolFunc.cpp \
  PDBSymbolFuncDebugEnd.cpp \
  PDBSymbolFuncDebugStart.cpp \
  PDBSymbolLabel.cpp \
  PDBSymbolPublicSymbol.cpp \
  PDBSymbolThunk.cpp \
  PDBSymbolTypeArray.cpp \
  PDBSymbolTypeBaseClass.cpp \
  PDBSymbolTypeBuiltin.cpp \
  PDBSymbolTypeCustom.cpp \
  PDBSymbolTypeDimension.cpp \
  PDBSymbolTypeEnum.cpp \
  PDBSymbolTypeFriend.cpp \
  PDBSymbolTypeFunctionArg.cpp \
  PDBSymbolTypeFunctionSig.cpp \
  PDBSymbolTypeManaged.cpp \
  PDBSymbolTypePointer.cpp \
  PDBSymbolTypeTypedef.cpp \
  PDBSymbolTypeUDT.cpp \
  PDBSymbolTypeVTable.cpp \
  PDBSymbolTypeVTableShape.cpp \
  PDBSymbolUnknown.cpp \
  PDBSymbolUsingNamespace.cpp \
  PDBSymDumper.cpp \
  UDTLayout.cpp \
  Native/DbiModuleDescriptor.cpp \
  Native/DbiModuleDescriptorBuilder.cpp \
  Native/DbiModuleList.cpp \
  Native/DbiStream.cpp \
  Native/DbiStreamBuilder.cpp \
  Native/EnumTables.cpp \
  Native/GlobalsStream.cpp \
  Native/Hash.cpp \
  Native/HashTable.cpp \
  Native/InfoStream.cpp \
  Native/InfoStreamBuilder.cpp \
  Native/InjectedSourceStream.cpp \
  Native/ModuleDebugStream.cpp \
  Native/NativeCompilandSymbol.cpp \
  Native/NativeEnumGlobals.cpp \
  Native/NativeEnumInjectedSources.cpp \
  Native/NativeEnumModules.cpp \
  Native/NativeEnumTypes.cpp \
  Native/NativeExeSymbol.cpp \
  Native/NativeRawSymbol.cpp \
  Native/NativeSymbolEnumerator.cpp \
  Native/NativeTypeArray.cpp \
  Native/NativeTypeBuiltin.cpp \
  Native/NativeTypeEnum.cpp \
  Native/NativeTypeFunctionSig.cpp \
  Native/NativeTypePointer.cpp \
  Native/NativeTypeTypedef.cpp \
  Native/NativeTypeUDT.cpp \
  Native/NativeTypeVTShape.cpp \
  Native/NamedStreamMap.cpp \
  Native/NativeSession.cpp \
  Native/PDBFile.cpp \
  Native/PDBFileBuilder.cpp \
  Native/PDBStringTable.cpp \
  Native/PDBStringTableBuilder.cpp \
  Native/PublicsStream.cpp \
  Native/GSIStreamBuilder.cpp \
  Native/RawError.cpp \
  Native/SymbolCache.cpp \
  Native/SymbolStream.cpp \
  Native/TpiHashing.cpp \
  Native/TpiStream.cpp \
  Native/TpiStreamBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_pdb_SRC_FILES)

LOCAL_MODULE:= libLLVM10DebugInfoPDB

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_pdb_SRC_FILES)

LOCAL_MODULE:= libLLVM10DebugInfoPDB

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
