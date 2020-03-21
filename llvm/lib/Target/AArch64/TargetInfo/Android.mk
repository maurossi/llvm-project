LOCAL_PATH := $(call my-dir)

aarch64_target_info_TBLGEN_TABLES90 := \
  AArch64GenSubtargetInfo.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc

aarch64_target_info_SRC_FILES := \
  AArch64TargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(aarch64_target_info_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90AArch64Info

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(aarch64_target_info_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90AArch64Info

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
