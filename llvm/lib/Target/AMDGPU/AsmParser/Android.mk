LOCAL_PATH := $(call my-dir)

amdgpu_asm_parser_SRC_FILES := \
  AMDGPUAsmParser.cpp

amdgpu_asm_parser_TBLGEN_TABLES10 := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_asm_parser_TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

amdgpu_asm_parser_C_INCLUDES :=	$(LOCAL_PATH)/..

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE := libLLVM10AMDGPUAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES10 := $(amdgpu_asm_parser_TBLGEN_TABLES10)
TBLGEN_TD_DIR10 := $(amdgpu_asm_parser_TBLGEN_TD_DIR10)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE := libLLVM10AMDGPUAsmParser
LOCAL_SRC_FILES := $(amdgpu_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(amdgpu_asm_parser_C_INCLUDES)
TBLGEN_TABLES10 := $(amdgpu_asm_parser_TBLGEN_TABLES10)
TBLGEN_TD_DIR10 := $(amdgpu_asm_parser_TBLGEN_TD_DIR10)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
