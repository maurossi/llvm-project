LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# obj2yaml command line tool
#===---------------------------------------------------------------===

obj2yaml_SRC_FILES := \
  obj2yaml.cpp \
  coff2yaml.cpp \
  elf2yaml.cpp \
  Error.cpp \

obj2yaml_STATIC_LIBRARIES := \
  libLLVM90Object             \
  libLLVM90MC                 \
  libLLVM90MCParser           \
  libLLVM90BitReader          \
  libLLVM90Core               \
  libLLVM90Support            \

include $(CLEAR_VARS)

LOCAL_MODULE := obj2yaml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(obj2yaml_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(obj2yaml_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
