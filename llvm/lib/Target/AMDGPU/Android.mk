LOCAL_PATH := $(call my-dir)

amdgpu_codegen_TBLGEN_TABLES10 := \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenDAGISel.inc  \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenCallingConv.inc \
  AMDGPUGenIntrinsicEnums.inc \
  AMDGPUGenIntrinsicImpl.inc \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenDisassemblerTables.inc \
  AMDGPUGenMCPseudoLowering.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenGlobalISel.inc \
  R600GenAsmWriter.inc \
  R600GenCallingConv.inc \
  R600GenDAGISel.inc \
  R600GenDFAPacketizer.inc \
  R600GenInstrInfo.inc \
  R600GenMCCodeEmitter.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_codegen_SRC_FILES := \
  AMDGPUAliasAnalysis.cpp \
  AMDGPUAlwaysInlinePass.cpp \
  AMDGPUAnnotateKernelFeatures.cpp \
  AMDGPUAnnotateUniformValues.cpp \
  AMDGPUArgumentUsageInfo.cpp \
  AMDGPUAsmPrinter.cpp \
  AMDGPUAtomicOptimizer.cpp \
  AMDGPUCodeGenPrepare.cpp \
  AMDGPUFixFunctionBitcasts.cpp \
  AMDGPUFrameLowering.cpp \
  AMDGPUHSAMetadataStreamer.cpp \
  AMDGPUInstrInfo.cpp \
  AMDGPUISelDAGToDAG.cpp \
  AMDGPUISelLowering.cpp \
  AMDGPULibCalls.cpp \
  AMDGPULibFunc.cpp \
  AMDGPULowerIntrinsics.cpp \
  AMDGPULowerKernelArguments.cpp \
  AMDGPULowerKernelAttributes.cpp \
  AMDGPUMachineCFGStructurizer.cpp \
  AMDGPUMachineFunction.cpp \
  AMDGPUMachineModuleInfo.cpp \
  AMDGPUMacroFusion.cpp \
  AMDGPUMCInstLower.cpp \
  AMDGPUOpenCLEnqueuedBlockLowering.cpp \
  AMDGPUPromoteAlloca.cpp \
  AMDGPUPropagateAttributes.cpp \
  AMDGPURegisterInfo.cpp \
  AMDGPURewriteOutArguments.cpp \
  AMDGPUSubtarget.cpp \
  AMDGPUTargetMachine.cpp \
  AMDGPUTargetObjectFile.cpp \
  AMDGPUTargetTransformInfo.cpp \
  AMDGPUUnifyDivergentExitNodes.cpp \
  AMDGPUUnifyMetadata.cpp \
  AMDGPUInline.cpp \
  AMDGPUPerfHintAnalysis.cpp \
  AMDILCFGStructurizer.cpp \
  GCNHazardRecognizer.cpp \
  GCNIterativeScheduler.cpp \
  GCNMinRegStrategy.cpp \
  GCNRegPressure.cpp \
  GCNSchedStrategy.cpp \
  R600AsmPrinter.cpp \
  R600ClauseMergePass.cpp \
  R600ControlFlowFinalizer.cpp \
  R600EmitClauseMarkers.cpp \
  R600ExpandSpecialInstrs.cpp \
  R600FrameLowering.cpp \
  R600InstrInfo.cpp \
  R600ISelLowering.cpp \
  R600MachineFunctionInfo.cpp \
  R600MachineScheduler.cpp \
  R600OpenCLImageTypeLoweringPass.cpp \
  R600OptimizeVectorRegisters.cpp \
  R600Packetizer.cpp \
  R600RegisterInfo.cpp \
  SIAddIMGInit.cpp \
  SIAnnotateControlFlow.cpp \
  SIFixSGPRCopies.cpp \
  SIFixupVectorISel.cpp \
  SIFixVGPRCopies.cpp \
  SIPreAllocateWWMRegs.cpp \
  SIFoldOperands.cpp \
  SIFormMemoryClauses.cpp \
  SIFrameLowering.cpp \
  SIInsertSkips.cpp \
  SIInsertWaitcnts.cpp \
  SIInstrInfo.cpp \
  SIISelLowering.cpp \
  SILoadStoreOptimizer.cpp \
  SILowerControlFlow.cpp \
  SILowerI1Copies.cpp \
  SILowerSGPRSpills.cpp \
  SIMachineFunctionInfo.cpp \
  SIMachineScheduler.cpp \
  SIMemoryLegalizer.cpp \
  SIOptimizeExecMasking.cpp \
  SIOptimizeExecMaskingPreRA.cpp \
  SIPeepholeSDWA.cpp \
  SIRegisterInfo.cpp \
  SIShrinkInstructions.cpp \
  SIWholeQuadMode.cpp \
  GCNILPSched.cpp \
  GCNRegBankReassign.cpp \
  GCNNSAReassign.cpp \
  GCNDPPCombine.cpp \
  SIModeRegister.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
amdgpu_codegen_TBLGEN_TABLES10 += \
  AMDGPUGenRegisterBank.inc

amdgpu_codegen_SRC_FILES += \
  AMDGPUCallLowering.cpp \
  AMDGPUInstructionSelector.cpp \
  AMDGPULegalizerInfo.cpp \
  AMDGPURegisterBankInfo.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

TBLGEN_TABLES10 := $(amdgpu_codegen_TBLGEN_TABLES10)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM10AMDGPUCodeGen

LOCAL_MODULE_HOST_OS := darwin linux windows

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

TBLGEN_TABLES10 := $(amdgpu_codegen_TBLGEN_TABLES10)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM10AMDGPUCodeGen

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
