LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# opt command line tool
#===---------------------------------------------------------------===

llvm_opt_SRC_FILES := \
  AnalysisWrappers.cpp \
  BreakpointPrinter.cpp \
  GraphPrinters.cpp \
  NewPMDriver.cpp \
  PassPrinters.cpp \
  PrintSCC.cpp \
  opt.cpp \

llvm_opt_STATIC_LIBRARIES := \
  libLLVM10IRReader \
  libLLVM10BitReader \
  libLLVM10BitWriter \
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
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10Object \
  libLLVM10ProfileData \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10Support \
  libLLVM10MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
