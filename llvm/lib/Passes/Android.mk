LOCAL_PATH:= $(call my-dir)

passes_SRC_FILES := \
  PassBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM90Passes
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(passes_SRC_FILES)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM90Passes
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(passes_SRC_FILES)

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
