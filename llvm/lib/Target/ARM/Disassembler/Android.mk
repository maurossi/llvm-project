LOCAL_PATH := $(call my-dir)

arm_disassembler_TBLGEN_TABLES10 := \
  ARMGenDisassemblerTables.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenSystemRegister.inc

arm_disassembler_SRC_FILES := \
  ARMDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(arm_disassembler_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10ARMDisassembler

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(arm_disassembler_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10ARMDisassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
