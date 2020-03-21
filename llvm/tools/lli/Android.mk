LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# lli command line tool
#===---------------------------------------------------------------===

lli_SRC_FILES := \
  lli.cpp \
  OrcLazyJIT.cpp \
  RemoteMemoryManager.cpp \
  RemoteTarget.cpp \
  RemoteTargetExternal.cpp \

lli_STATIC_LIBRARIES := \
  libLLVM10IRReader \
  libLLVM10BitReader \
  libLLVM10ARMCodeGen \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMAsmParser \
  libLLVM10ARMDisassembler \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsAsmParser \
  libLLVM10MipsDisassembler \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmPrinter \
  libLLVM10X86AsmParser \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10Instrumentation \
  libLLVM10Linker \
  libLLVM10Interpreter \
  libLLVM10ScalarOpts \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10MC \
  libLLVM10MCJIT \
  libLLVM10OrcJIT \
  libLLVM10ExecutionEngine \
  libLLVM10RuntimeDyld \
  libLLVM10MCParser \
  libLLVM10Object \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10Support \
  libLLVM10MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := lli
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(lli_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(lli_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
