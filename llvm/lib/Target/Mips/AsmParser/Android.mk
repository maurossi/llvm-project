LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libLLVM10MipsAsmParser (common)
#===---------------------------------------------------------------===

mips_asm_parser_SRC_FILES := \
  MipsAsmParser.cpp

mips_asm_parser_C_INCLUDES := $(LOCAL_PATH)/..

mips_asm_parser_TBLGEN_TABLES10 := \
  MipsGenAsmMatcher.inc \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_asm_parser_TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libLLVM10MipsAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10MipsAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES10 := $(mips_asm_parser_TBLGEN_TABLES10)
TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libLLVM10MipsAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10MipsAsmParser
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES10 := $(mips_asm_parser_TBLGEN_TABLES10)
TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
