LOCAL_PATH:= $(call my-dir)

instrumentation_SRC_FILES := \
  AddressSanitizer.cpp \
  BoundsChecking.cpp \
  CGProfile.cpp \
  ControlHeightReduction.cpp \
  DataFlowSanitizer.cpp \
  GCOVProfiling.cpp \
  MemorySanitizer.cpp \
  IndirectCallPromotion.cpp \
  Instrumentation.cpp \
  InstrOrderFile.cpp \
  InstrProfiling.cpp \
  PGOInstrumentation.cpp \
  PGOMemOPSizeOpt.cpp \
  PoisonChecking.cpp \
  SanitizerCoverage.cpp \
  ThreadSanitizer.cpp \
  HWAddressSanitizer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10Instrumentation
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(instrumentation_SRC_FILES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the target
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10Instrumentation
LOCAL_SRC_FILES := $(instrumentation_SRC_FILES)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
