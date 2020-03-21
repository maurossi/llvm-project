LOCAL_PATH:= $(call my-dir)

xray_SRC_FILES := \
  InstrumentationMap.cpp \
  Trace.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10XRay
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(xray_SRC_FILES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10XRay
LOCAL_SRC_FILES := $(xray_SRC_FILES)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
