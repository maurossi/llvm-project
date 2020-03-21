LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-mc command line tool
#===---------------------------------------------------------------===

llvm_mc_SRC_FILES := \
  llvm-mc.cpp \
  Disassembler.cpp

llvm_mc_STATIC_LIBRARIES := \
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
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90X86CodeGen \
  libLLVM90AsmPrinter \
  libLLVM90CodeGen \
  libLLVM90TransformUtils \
  libLLVM90Target \
  libLLVM90Analysis \
  libLLVM90MC \
  libLLVM90Object \
  libLLVM90BitReader \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Support \
  libLLVM90MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-mc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_mc_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_mc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
