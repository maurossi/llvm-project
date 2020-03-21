LOCAL_PATH := $(call my-dir)

object_SRC_FILES := \
  Archive.cpp \
  ArchiveWriter.cpp \
  Binary.cpp \
  COFFImportFile.cpp \
  COFFModuleDefinition.cpp \
  COFFObjectFile.cpp \
  Decompressor.cpp \
  ELF.cpp \
  ELFObjectFile.cpp \
  Error.cpp \
  IRObjectFile.cpp \
  IRSymtab.cpp \
  MachOObjectFile.cpp \
  MachOUniversal.cpp \
  Minidump.cpp \
  ModuleSymbolTable.cpp \
  Object.cpp \
  ObjectFile.cpp \
  RecordStreamer.cpp \
  RelocationResolver.cpp \
  SymbolicFile.cpp \
  SymbolSize.cpp \
  WasmObjectFile.cpp \
  WindowsMachineFlag.cpp \
  WindowsResource.cpp \
  XCOFFObjectFile.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10Object
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(object_SRC_FILES)

# Our windows cross-compiler triggers a spurious uninitialized warning.
LOCAL_CFLAGS_windows := -Wno-uninitialized

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10Object

LOCAL_SRC_FILES := $(object_SRC_FILES)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
