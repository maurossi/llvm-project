LOCAL_PATH := $(call my-dir)

arm_utils_TBLGEN_TABLES10 := \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenSystemOperands.inc \
  ARMGenSystemRegister.inc

arm_utils_SRC_FILES := \
  ARMBaseInfo.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10ARMUtils

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(arm_utils_TBLGEN_TABLES10)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10ARMUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(arm_utils_TBLGEN_TABLES10)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
