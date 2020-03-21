LOCAL_PATH := $(call my-dir)

amdgpu_utils_TBLGEN_TABLES10 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenIntrinsicEnums.inc \
  AMDGPUGenIntrinsicImpl.inc \
  AMDGPUGenSearchableTables.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_utils_SRC_FILES := \
  AMDGPUBaseInfo.cpp \
  AMDKernelCodeTUtils.cpp \
  AMDGPUAsmUtils.cpp \
  AMDGPUPALMetadata.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM10AMDGPUUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(amdgpu_utils_TBLGEN_TABLES10)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM10AMDGPUUtils

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..
TBLGEN_TABLES10 := $(amdgpu_utils_TBLGEN_TABLES10)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
