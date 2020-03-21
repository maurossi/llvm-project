LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-lto command line tool
#===---------------------------------------------------------------===

llvm_lto_SRC_FILES := \
  llvm-lto.cpp

llvm_lto_STATIC_LIBRARIES := \
  libLLVM90ARMCodeGen \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMAsmParser \
  libLLVM90ARMDisassembler \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Info \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Desc \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler \
  libLLVM90MipsCodeGen \
  libLLVM90MipsInfo \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmPrinter \
  libLLVM90MipsAsmParser \
  libLLVM90MipsDisassembler \
  libLLVM90X86CodeGen \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmPrinter \
  libLLVM90X86AsmParser \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90AsmPrinter \
  libLLVM90SelectionDAG \
  libLLVM90LTO \
  libLLVM90CodeGen \
  libLLVM90Target \
  libLLVM90BitReader \
  libLLVM90BitWriter \
  libLLVM90Linker \
  libLLVM90ipo \
  libLLVM90IRReader \
  libLLVM90TransformObjCARC \
  libLLVM90ScalarOpts \
  libLLVM90InstCombine \
  libLLVM90Vectorize \
  libLLVM90Instrumentation \
  libLLVM90TransformUtils \
  libLLVM90Analysis \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90MCDisassembler \
  libLLVM90Object \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Option \
  libLLVM90Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-lto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
