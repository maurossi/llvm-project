LOCAL_PATH := $(call my-dir)

mips_codegen_TBLGEN_TABLES10 := \
  MipsGenRegisterBank.inc \
  MipsGenRegisterInfo.inc \
  MipsGenInstrInfo.inc \
  MipsGenGlobalISel.inc \
  MipsGenMCCodeEmitter.inc \
  MipsGenMCPseudoLowering.inc \
  MipsGenAsmWriter.inc \
  MipsGenDAGISel.inc \
  MipsGenFastISel.inc \
  MipsGenCallingConv.inc \
  MipsGenSubtargetInfo.inc \
  MipsGenDisassemblerTables.inc \
  MipsGenAsmMatcher.inc

mips_codegen_SRC_FILES := \
  Mips16FrameLowering.cpp \
  Mips16HardFloat.cpp \
  Mips16HardFloatInfo.cpp \
  Mips16InstrInfo.cpp \
  Mips16ISelDAGToDAG.cpp \
  Mips16ISelLowering.cpp \
  Mips16RegisterInfo.cpp \
  MipsAnalyzeImmediate.cpp \
  MipsAsmPrinter.cpp \
  MipsCallLowering.cpp \
  MipsCCState.cpp \
  MipsConstantIslandPass.cpp \
  MipsDelaySlotFiller.cpp \
  MipsExpandPseudo.cpp \
  MipsFastISel.cpp \
  MipsInstrInfo.cpp \
  MipsInstructionSelector.cpp \
  MipsISelDAGToDAG.cpp \
  MipsISelLowering.cpp \
  MipsFrameLowering.cpp \
  MipsLegalizerInfo.cpp \
  MipsBranchExpansion.cpp \
  MipsMCInstLower.cpp \
  MipsMachineFunction.cpp \
  MipsModuleISelDAGToDAG.cpp \
  MipsPreLegalizerCombiner.cpp \
  MipsOptimizePICCall.cpp \
  MipsOs16.cpp \
  MipsRegisterBankInfo.cpp \
  MipsRegisterInfo.cpp \
  MipsSEFrameLowering.cpp \
  MipsSEInstrInfo.cpp \
  MipsSEISelDAGToDAG.cpp \
  MipsSEISelLowering.cpp \
  MipsSERegisterInfo.cpp \
  MipsSubtarget.cpp \
  MipsTargetMachine.cpp \
  MipsTargetObjectFile.cpp \
  MicroMipsSizeReduction.cpp


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10MipsCodeGen
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(mips_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc

TBLGEN_TABLES10 := $(mips_codegen_TBLGEN_TABLES10)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE:= libLLVM10MipsCodeGen

LOCAL_SRC_FILES := $(mips_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc

TBLGEN_TABLES10 := $(mips_codegen_TBLGEN_TABLES10)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
