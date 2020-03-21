LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-nm command line tool
#===---------------------------------------------------------------===

llvm_nm_SRC_FILES := \
  llvm-nm.cpp

llvm_nm_STATIC_LIBRARIES := \
  libLLVM10ARMCodeGen \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMAsmParser \
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
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmPrinter \
  libLLVM10X86AsmParser \
  libLLVM10X86CodeGen \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10CodeGen \
  libLLVM10TransformUtils \
  libLLVM10Target \
  libLLVM10Analysis \
  libLLVM10Object             \
  libLLVM10BitReader          \
  libLLVM10MC                 \
  libLLVM10MCParser           \
  libLLVM10Core               \
  libLLVM10Support            \
  libLLVM10MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-nm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_nm_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_nm_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
