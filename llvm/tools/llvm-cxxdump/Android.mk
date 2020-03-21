LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM90_ROOT_PATH)/llvm.mk

llvm_cxxdump_SRC_FILES := \
  Error.cpp \
  llvm-cxxdump.cpp

llvm_cxxdump_STATIC_LIBRARIES := \
  libLLVM90ARMAsmParser \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMDisassembler \
  libLLVM90AArch64Info \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler \
  libLLVM90MipsInfo \
  libLLVM90MipsAsmParser \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmPrinter \
  libLLVM90MipsDisassembler \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmParser \
  libLLVM90X86CodeGen \
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90AsmPrinter \
  libLLVM90CodeGen \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90Object \
  libLLVM90MCParser \
  libLLVM90MC \
  libLLVM90MCDisassembler \
  libLLVM90BitReader \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Support \


include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cxxdump
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_cxxdump_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_cxxdump_STATIC_LIBRARIES)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
