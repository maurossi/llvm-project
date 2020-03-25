LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# not command line tool
#===---------------------------------------------------------------===

not_SRC_FILES := \
  not.cpp

not_STATIC_LIBRARIES := \
  libLLVM90Core               \
  libLLVM90Support            \

include $(CLEAR_VARS)

LOCAL_MODULE := not
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(not_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(not_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
