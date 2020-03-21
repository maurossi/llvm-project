LOCAL_PATH := $(call my-dir)

x86_disassembler_TBLGEN_TABLES10 := \
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
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(x86_disassembler_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10X86Disassembler

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(x86_disassembler_TBLGEN_TABLES10)

TBLGEN_TD_DIR10 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM10X86Disassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
