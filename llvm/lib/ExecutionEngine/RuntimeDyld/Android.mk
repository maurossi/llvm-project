LOCAL_PATH:= $(call my-dir)

runtimedyld_SRC_FILES := \
  JITSymbol.cpp \
  RTDyldMemoryManager.cpp \
  RuntimeDyld.cpp \
  RuntimeDyldChecker.cpp \
  RuntimeDyldCOFF.cpp \
  RuntimeDyldELF.cpp \
  RuntimeDyldMachO.cpp \
  Targets/RuntimeDyldELFMips.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVM10RuntimeDyld

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVM10RuntimeDyld

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
