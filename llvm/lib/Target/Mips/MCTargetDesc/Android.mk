LOCAL_PATH := $(call my-dir)

mips_mc_desc_TBLGEN_TABLES90 := \
  MipsGenAsmWriter.inc \
  MipsGenRegisterInfo.inc \
  MipsGenInstrInfo.inc \
  MipsGenMCCodeEmitter.inc \
  MipsGenSubtargetInfo.inc

mips_mc_desc_SRC_FILES := \
  MipsABIInfo.cpp \
  MipsABIFlagsSection.cpp \
  MipsAsmBackend.cpp \
  MipsELFObjectWriter.cpp \
  MipsELFStreamer.cpp \
  MipsInstPrinter.cpp \
  MipsMCAsmInfo.cpp \
  MipsMCCodeEmitter.cpp \
  MipsMCExpr.cpp \
  MipsMCTargetDesc.cpp \
  MipsNaClELFStreamer.cpp \
  MipsOptionRecord.cpp \
  MipsTargetStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

LOCAL_MODULE:= libLLVM90MipsDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(mips_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..
TBLGEN_TABLES90 := $(mips_mc_desc_TBLGEN_TABLES90)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

LOCAL_MODULE:= libLLVM90MipsDesc

LOCAL_SRC_FILES := $(mips_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..
TBLGEN_TABLES90 := $(mips_mc_desc_TBLGEN_TABLES90)

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
