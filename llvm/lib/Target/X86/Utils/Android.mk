LOCAL_PATH := $(call my-dir)

x86_utils_SRC_FILES := \
  X86ShuffleDecode.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(x86_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90X86Utils

include $(LLVM90_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(x86_utils_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90X86Utils

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM90_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
