LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-bcanalyzer command line tool
#===---------------------------------------------------------------===

llvm_bcanalyzer_SRC_FILES := \
  llvm-bcanalyzer.cpp

llvm_bcanalyzer_STATIC_LIBRARIES := \
  libLLVM10BitReader                  \
  libLLVM10Core                       \
  libLLVM10Support                    \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-bcanalyzer
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_bcanalyzer_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_bcanalyzer_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_C_INCLUDES += external/llvm/include

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
