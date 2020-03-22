LOCAL_PATH:= $(call my-dir)

binary_format_SRC_FILES := \
  AMDGPUMetadataVerifier.cpp \
  Dwarf.cpp \
  Magic.cpp \
  Minidump.cpp \
  MsgPackDocument.cpp \
  MsgPackDocumentYAML.cpp \
  MsgPackReader.cpp \
  MsgPackWriter.cpp \
  Wasm.cpp \
  XCOFF.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM10BinaryFormat

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM10BinaryFormat

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
