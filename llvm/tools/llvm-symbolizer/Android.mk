LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM90_ROOT_PATH)/llvm.mk

llvm_symbolizer_SRC_FILES := \
  llvm-symbolizer.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM90Symbolize \
  libLLVM90DebugInfoDWARF \
  libLLVM90DebugInfoPDB \
  libLLVM90Object \
  libLLVM90BitReader \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90Support

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_SHARED_LIBRARIES := libLLVM90

include $(LLVM90_DEVICE_BUILD_MK)
include $(BUILD_EXECUTABLE)
endif
