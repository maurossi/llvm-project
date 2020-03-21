LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# yaml2obj command line tool
#===---------------------------------------------------------------===

yaml2obj_SRC_FILES := \
  yaml2obj.cpp        \
  yaml2coff.cpp       \
  yaml2elf.cpp        \

yaml2obj_STATIC_LIBRARIES := \
  libLLVM10Object              \
  libLLVM10MC                  \
  libLLVM10MCParser            \
  libLLVM10BitReader           \
  libLLVM10Core                \
  libLLVM10Support             \

include $(CLEAR_VARS)

LOCAL_MODULE := yaml2obj
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(yaml2obj_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(yaml2obj_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
