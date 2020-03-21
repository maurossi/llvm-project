LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM90MipsAsmParser \
  libLLVM90MipsInfo \
  libLLVM90MipsCodeGen \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM90X86Info \
  libLLVM90X86AsmParser \
  libLLVM90X86CodeGen \
  libLLVM90X86Disassembler \
  libLLVM90X86Desc \
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM90ARMCodeGen \
  libLLVM90ARMDisassembler \
  libLLVM90ARMAsmParser \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMDesc \
  libLLVM90ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM90AsmPrinter \
  libLLVM90IRReader \
  libLLVM90AsmParser \
  libLLVM90BitReader \
  libLLVM90BitWriter \
  libLLVM90SelectionDAG \
  libLLVM90InstCombine \
  libLLVM90CodeGen \
  libLLVM90Instrumentation \
  libLLVM90Object \
  libLLVM90ipo \
  libLLVM90Linker \
  libLLVM90MCDisassembler \
  libLLVM90MC \
  libLLVM90MIRParser \
  libLLVM90MCParser \
  libLLVM90ScalarOpts \
  libLLVM90TransformUtils \
  libLLVM90Vectorize \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90Core \
  libLLVM90Support \
  libLLVM90Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM90AArch64Info \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Disassembler \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Utils



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

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM90_SUPPORTED_ARCH)))
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

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
