LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM90DebugInfoDWARF \
  libLLVM90Object \
  libLLVM90BitReader \
  libLLVM90ARMCodeGen \
  libLLVM90ARMAsmParser \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMDisassembler \
  libLLVM90MipsCodeGen \
  libLLVM90MipsInfo \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmParser \
  libLLVM90MipsAsmPrinter \
  libLLVM90MipsDisassembler \
  libLLVM90X86CodeGen \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmParser \
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Info \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler \
  libLLVM90ExecutionEngine \
  libLLVM90RuntimeDyld \
  libLLVM90MCJIT \
  libLLVM90OrcJIT \
  libLLVM90AsmPrinter \
  libLLVM90SelectionDAG \
  libLLVM90CodeGen \
  libLLVM90Object \
  libLLVM90ScalarOpts \
  libLLVM90InstCombine \
  libLLVM90Instrumentation \
  libLLVM90TransformObjCARC \
  libLLVM90TransformUtils \
  libLLVM90Vectorize \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90MCDisassembler \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Option \
  libLLVM90LTO \
  libLLVM90Support \
  libLLVM90ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
