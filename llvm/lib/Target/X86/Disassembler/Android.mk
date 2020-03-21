LOCAL_PATH := $(call my-dir)

x86_disassembler_TBLGEN_TABLES90 := \
  X86GenDisassemblerTables.inc \
  X86GenInstrInfo.inc \
  X86GenRegisterInfo.inc \
  X86GenSubtargetInfo.inc

x86_disassembler_SRC_FILES := \
  X86Disassembler.cpp \
  X86DisassemblerDecoder.cpp


# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(x86_disassembler_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90X86Disassembler

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

TBLGEN_TABLES90 := $(x86_disassembler_TBLGEN_TABLES90)

TBLGEN_TD_DIR90 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM90X86Disassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
