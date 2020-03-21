LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM10IRReader \
  libLLVM10ARMCodeGen \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMDisassembler \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsDisassembler \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10Symbolize \
  libLLVM10DebugInfoDWARF \
  libLLVM10DebugInfoPDB \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10TransformObjCARC \
  libLLVM10Vectorize \
  libLLVM10ScalarOpts \
  libLLVM10Passes \
  libLLVM10ipo \
  libLLVM10Linker \
  libLLVM10InstCombine \
  libLLVM10Instrumentation \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Object \
  libLLVM10BitReader \
  libLLVM10BitWriter \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10ProfileData \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10Support \
  libLLVM10MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
