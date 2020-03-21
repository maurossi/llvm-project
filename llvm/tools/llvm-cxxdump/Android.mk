LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM10_ROOT_PATH)/llvm.mk

llvm_cxxdump_SRC_FILES := \
  Error.cpp \
  llvm-cxxdump.cpp

llvm_cxxdump_STATIC_LIBRARIES := \
  libLLVM10ARMAsmParser \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMDisassembler \
  libLLVM10AArch64Info \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10MipsInfo \
  libLLVM10MipsAsmParser \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsDisassembler \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmParser \
  libLLVM10X86CodeGen \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10AsmPrinter \
  libLLVM10CodeGen \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Object \
  libLLVM10MCParser \
  libLLVM10MC \
  libLLVM10MCDisassembler \
  libLLVM10BitReader \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Support \


include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cxxdump
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_cxxdump_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_cxxdump_STATIC_LIBRARIES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
