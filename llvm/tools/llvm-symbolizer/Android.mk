LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM10_ROOT_PATH)/llvm.mk

llvm_symbolizer_SRC_FILES := \
  llvm-symbolizer.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM10Symbolize \
  libLLVM10DebugInfoDWARF \
  libLLVM10DebugInfoPDB \
  libLLVM10Object \
  libLLVM10BitReader \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10Core \
  libLLVM10Support

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
LOCAL_MODULE := llvm-symbolizer
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_symbolizer_SRC_FILES)
LOCAL_SHARED_LIBRARIES := libLLVM10

include $(LLVM10_DEVICE_BUILD_MK)
include $(BUILD_EXECUTABLE)
endif
