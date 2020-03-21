LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM10DebugInfoDWARF \
  libLLVM10Object \
  libLLVM10BitReader \
  libLLVM10ARMCodeGen \
  libLLVM10ARMAsmParser \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMDisassembler \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmParser \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsDisassembler \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmParser \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10ExecutionEngine \
  libLLVM10RuntimeDyld \
  libLLVM10MCJIT \
  libLLVM10OrcJIT \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10Object \
  libLLVM10ScalarOpts \
  libLLVM10InstCombine \
  libLLVM10Instrumentation \
  libLLVM10TransformObjCARC \
  libLLVM10TransformUtils \
  libLLVM10Vectorize \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10MCDisassembler \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10LTO \
  libLLVM10Support \
  libLLVM10ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
