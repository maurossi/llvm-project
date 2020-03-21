LOCAL_PATH := $(call my-dir)

aarch64_target_info_TBLGEN_TABLES10 := \
  AArch64GenSubtargetInfo.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc

aarch64_target_info_SRC_FILES := \
  AArch64TargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(aarch64_target_info_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10AArch64Info

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(aarch64_target_info_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10AArch64Info

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
