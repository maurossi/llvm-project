LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM10Linker \
  libLLVM10IRReader \
  libLLVM10Object \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10BitReader \
  libLLVM10BitWriter \
  libLLVM10AsmParser \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Core \
  libLLVM10Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif
