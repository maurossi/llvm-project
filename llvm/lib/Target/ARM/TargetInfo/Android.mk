LOCAL_PATH := $(call my-dir)

arm_target_info_TBLGEN_TABLES90 := \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc

arm_target_info_SRC_FILES := \
  ARMTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(arm_target_info_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90ARMInfo

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(arm_target_info_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90ARMInfo

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
