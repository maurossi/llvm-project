LOCAL_PATH:= $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../../..
include $(LLVM10_ROOT_PATH)/llvm.mk

transforms_hello_SRC_FILES := \
  Hello.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_hello_SRC_FILES)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE:= LLVM10Hello

LOCAL_LDFLAGS_darwin := -Wl,-undefined -Wl,dynamic_lookup

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
