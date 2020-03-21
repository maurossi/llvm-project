LOCAL_PATH := $(call my-dir)

aarch64_mc_desc_TBLGEN_TABLES10 := \
  AArch64GenAsmWriter.inc \
  AArch64GenAsmWriter1.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenMCCodeEmitter.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenSystemOperands.inc

aarch64_mc_desc_SRC_FILES := \
  AArch64AsmBackend.cpp \
  AArch64ELFObjectWriter.cpp \
  AArch64ELFStreamer.cpp \
  AArch64InstPrinter.cpp \
  AArch64MCAsmInfo.cpp \
  AArch64MCCodeEmitter.cpp \
  AArch64MCExpr.cpp \
  AArch64MCTargetDesc.cpp \
  AArch64MachObjectWriter.cpp \
  AArch64TargetStreamer.cpp \
  AArch64WinCOFFObjectWriter.cpp \
  AArch64WinCOFFStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)


LOCAL_MODULE:= libLLVM10AArch64Desc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(aarch64_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(aarch64_mc_desc_TBLGEN_TABLES10)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10AArch64Desc

LOCAL_SRC_FILES := $(aarch64_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(aarch64_mc_desc_TBLGEN_TABLES10)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
