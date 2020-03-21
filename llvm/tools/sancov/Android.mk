LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM90IRReader \
  libLLVM90ARMCodeGen \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMDisassembler \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Info \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler \
  libLLVM90MipsCodeGen \
  libLLVM90MipsInfo \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmPrinter \
  libLLVM90MipsDisassembler \
  libLLVM90X86CodeGen \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90Symbolize \
  libLLVM90DebugInfoDWARF \
  libLLVM90DebugInfoPDB \
  libLLVM90AsmPrinter \
  libLLVM90SelectionDAG \
  libLLVM90CodeGen \
  libLLVM90TransformObjCARC \
  libLLVM90Vectorize \
  libLLVM90ScalarOpts \
  libLLVM90Passes \
  libLLVM90ipo \
  libLLVM90Linker \
  libLLVM90InstCombine \
  libLLVM90Instrumentation \
  libLLVM90TransformUtils \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90Object \
  libLLVM90BitReader \
  libLLVM90BitWriter \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90ProfileData \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Option \
  libLLVM90Support \
  libLLVM90MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
