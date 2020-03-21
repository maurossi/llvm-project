LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libARMAsmParser (common)
#===---------------------------------------------------------------===

arm_asm_parser_SRC_FILES := \
  ARMAsmParser.cpp

arm_asm_parser_TBLGEN_TABLES90 := \
  ARMGenInstrInfo.inc \
  ARMGenRegisterInfo.inc \
  ARMGenAsmMatcher.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenSystemRegister.inc

arm_asm_parser_TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

arm_asm_parser_C_INCLUDES := $(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libARMAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

LOCAL_MODULE:= libLLVM90ARMAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(arm_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(arm_asm_parser_C_INCLUDES)
TBLGEN_TABLES90 := $(arm_asm_parser_TBLGEN_TABLES90)
TBLGEN_TD_DIR90 := $(arm_asm_parser_TBLGEN_TD_DIR90)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
# Override the default optimization level to work around taking forever (~50m)
# to compile ARMAsmParser.cpp on Mac with gcc 4.2,
# or on Linux with mingw32msvc-gcc 4.2, which is used to cross-compile
# the win_sdk.
LOCAL_CFLAGS_darwin += -O0
LOCAL_CFLAGS_windows += -O0
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libARMAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

LOCAL_MODULE:= libLLVM90ARMAsmParser
LOCAL_SRC_FILES := $(arm_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(arm_asm_parser_C_INCLUDES)
TBLGEN_TABLES90 := $(arm_asm_parser_TBLGEN_TABLES90)
TBLGEN_TD_DIR90 := $(arm_asm_parser_TBLGEN_TD_DIR90)

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
