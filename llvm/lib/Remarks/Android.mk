LOCAL_PATH:= $(call my-dir)

remarks_SRC_FILES := \
  BitstreamRemarkParser.cpp \
  BitstreamRemarkSerializer.cpp \
  Remark.cpp \
  RemarkFormat.cpp \
  RemarkLinker.cpp \
  RemarkParser.cpp \
  RemarkSerializer.cpp \
  RemarkStringTable.cpp \
  YAMLRemarkParser.cpp \
  YAMLRemarkSerializer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(remarks_SRC_FILES)

LOCAL_MODULE:= libLLVM10Remarks

LOCAL_MODULE_TAGS := optional

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(remarks_SRC_FILES)

LOCAL_MODULE:= libLLVM10Remarks

LOCAL_MODULE_TAGS := optional

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
