LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-extract command line tool
#===---------------------------------------------------------------===

llvm_extract_SRC_FILES := \
  llvm-extract.cpp

llvm_extract_STATIC_LIBRARIES := \
  libLLVM10IRReader                \
  libLLVM10AsmParser               \
  libLLVM10Object                  \
  libLLVM10BitReader               \
  libLLVM10BitWriter               \
  libLLVM10ipo                     \
  libLLVM10TransformUtils          \
  libLLVM10Analysis                \
  libLLVM10Target                  \
  libLLVM10Core                    \
  libLLVM10Support                 \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-extract
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_extract_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_extract_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
