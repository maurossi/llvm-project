LOCAL_PATH:= $(call my-dir)

codegen_selectiondag_SRC_FILES := \
  DAGCombiner.cpp \
  FastISel.cpp \
  FunctionLoweringInfo.cpp \
  InstrEmitter.cpp \
  LegalizeDAG.cpp \
  LegalizeFloatTypes.cpp \
  LegalizeIntegerTypes.cpp \
  LegalizeTypes.cpp \
  LegalizeTypesGeneric.cpp \
  LegalizeVectorOps.cpp \
  LegalizeVectorTypes.cpp \
  ResourcePriorityQueue.cpp \
  ScheduleDAGFast.cpp \
  ScheduleDAGRRList.cpp \
  ScheduleDAGSDNodes.cpp \
  ScheduleDAGVLIW.cpp \
  SelectionDAGBuilder.cpp \
  SelectionDAG.cpp \
  SelectionDAGAddressAnalysis.cpp \
  SelectionDAGDumper.cpp \
  SelectionDAGISel.cpp \
  SelectionDAGPrinter.cpp \
  SelectionDAGTargetInfo.cpp \
  StatepointLowering.cpp \
  TargetLowering.cpp


# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_selectiondag_SRC_FILES)

LOCAL_MODULE:= libLLVM10SelectionDAG

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_selectiondag_SRC_FILES)

LOCAL_MODULE:= libLLVM10SelectionDAG

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
