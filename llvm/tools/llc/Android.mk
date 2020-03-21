LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM10MipsAsmParser \
  libLLVM10MipsInfo \
  libLLVM10MipsCodeGen \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM10X86Info \
  libLLVM10X86AsmParser \
  libLLVM10X86CodeGen \
  libLLVM10X86Disassembler \
  libLLVM10X86Desc \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM10ARMCodeGen \
  libLLVM10ARMDisassembler \
  libLLVM10ARMAsmParser \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMDesc \
  libLLVM10ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM10AsmPrinter \
  libLLVM10IRReader \
  libLLVM10AsmParser \
  libLLVM10BitReader \
  libLLVM10BitWriter \
  libLLVM10SelectionDAG \
  libLLVM10InstCombine \
  libLLVM10CodeGen \
  libLLVM10Instrumentation \
  libLLVM10Object \
  libLLVM10ipo \
  libLLVM10Linker \
  libLLVM10MCDisassembler \
  libLLVM10MC \
  libLLVM10MIRParser \
  libLLVM10MCParser \
  libLLVM10ScalarOpts \
  libLLVM10TransformUtils \
  libLLVM10Vectorize \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Core \
  libLLVM10Support \
  libLLVM10Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM10AArch64Info \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Disassembler \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils



#===---------------------------------------------------------------===
# llc command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)

LOCAL_STATIC_LIBRARIES := \
  $(llvm_llc_arm_STATIC_LIBRARIES) \
  $(llvm_llc_mips_STATIC_LIBRARIES) \
  $(llvm_llc_x86_STATIC_LIBRARIES) \
  $(llvm_llc_aarch64_STATIC_LIBRARIES) \
  $(llvm_llc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM10_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llc build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)
LOCAL_C_INCLUDES += external/llvm/include

LOCAL_STATIC_LIBRARIES_arm += $(llvm_llc_arm_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips64 += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86_64 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_aarch64_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_arm_STATIC_LIBRARIES)

LOCAL_STATIC_LIBRARIES += $(llvm_llc_STATIC_LIBRARIES)

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
