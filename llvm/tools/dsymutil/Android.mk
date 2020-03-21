LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM10_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM10ARMCodeGen \
  libLLVM10ARMAsmParser \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMDisassembler \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsAsmParser \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsDisassembler \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmParser \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10X86CodeGen \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10DebugInfoDWARF \
  libLLVM10Instrumentation \
  libLLVM10MCParser \
  libLLVM10MCDisassembler \
  libLLVM10Object \
  libLLVM10BitReader \
  libLLVM10ScalarOpts \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Core \
  libLLVM10MC \
  libLLVM10Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
