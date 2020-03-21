LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-extract command line tool
#===---------------------------------------------------------------===

llvm_extract_SRC_FILES := \
  llvm-extract.cpp

llvm_extract_STATIC_LIBRARIES := \
  libLLVM90IRReader                \
  libLLVM90AsmParser               \
  libLLVM90Object                  \
  libLLVM90BitReader               \
  libLLVM90BitWriter               \
  libLLVM90ipo                     \
  libLLVM90TransformUtils          \
  libLLVM90Analysis                \
  libLLVM90Target                  \
  libLLVM90Core                    \
  libLLVM90Support                 \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-extract
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_extract_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_extract_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
