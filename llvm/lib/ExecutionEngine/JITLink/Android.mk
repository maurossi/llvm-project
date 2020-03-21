LOCAL_PATH:= $(call my-dir)

jitlink_SRC_FILES := \
  JITLink.cpp \
  JITLinkGeneric.cpp \
  JITLinkMemoryManager.cpp \
  EHFrameSupport.cpp \
  MachO.cpp \
  MachO_x86_64.cpp \
  MachOAtomGraphBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(jitlink_SRC_FILES)
LOCAL_MODULE := libLLVM90JITLink

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(jitlink_SRC_FILES)
LOCAL_MODULE := libLLVM90JITLink

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
