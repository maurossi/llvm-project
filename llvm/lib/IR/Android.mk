LOCAL_PATH:= $(call my-dir)

vmcore_SRC_FILES := \
  AbstractCallSite.cpp \
  AsmWriter.cpp \
  Attributes.cpp \
  AutoUpgrade.cpp \
  BasicBlock.cpp \
  Comdat.cpp \
  ConstantFold.cpp \
  ConstantRange.cpp \
  Constants.cpp \
  Core.cpp \
  DIBuilder.cpp \
  DataLayout.cpp \
  DebugInfo.cpp \
  DebugInfoMetadata.cpp \
  DebugLoc.cpp \
  DiagnosticHandler.cpp \
  DiagnosticInfo.cpp \
  DiagnosticPrinter.cpp \
  Dominators.cpp \
  Function.cpp \
  GVMaterializer.cpp \
  Globals.cpp \
  IRBuilder.cpp \
  IRPrintingPasses.cpp \
  InlineAsm.cpp \
  Instruction.cpp \
  Instructions.cpp \
  IntrinsicInst.cpp \
  LLVMContext.cpp \
  LLVMContextImpl.cpp \
  LegacyPassManager.cpp \
  MDBuilder.cpp \
  Mangler.cpp \
  Metadata.cpp \
  Module.cpp \
  ModuleSummaryIndex.cpp \
  Operator.cpp \
  OptBisect.cpp \
  Pass.cpp \
  PassInstrumentation.cpp \
  PassManager.cpp \
  PassRegistry.cpp \
  PassTimingInfo.cpp \
  RemarkStreamer.cpp \
  SafepointIRVerifier.cpp \
  ProfileSummary.cpp \
  Statepoint.cpp \
  Type.cpp \
  TypeFinder.cpp \
  Use.cpp \
  User.cpp \
  Value.cpp \
  ValueSymbolTable.cpp \
  Verifier.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES)

LOCAL_MODULE:= libLLVM10Core

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(LOCAL_PATH)/llvm-gen-local.mk
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES)

LOCAL_MODULE:= libLLVM10Core
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := $(call local-generated-sources-dir)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(LOCAL_PATH)/llvm-gen-local.mk
include $(BUILD_STATIC_LIBRARY)
endif
