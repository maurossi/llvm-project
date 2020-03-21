LOCAL_PATH:= $(call my-dir)

tablegen_global_isel_SRC_FILES += \
      CodeExpander.cpp \
      GIMatchDag.cpp \
      GIMatchDagEdge.cpp \
      GIMatchDagInstr.cpp \
      GIMatchDagOperands.cpp \
      GIMatchDagPredicate.cpp \
      GIMatchDagPredicateDependencyEdge.cpp \
      GIMatchTree.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(tablegen_global_isel_SRC_FILES)

LOCAL_MODULE:= libLLVM10TableGenGlobalISel

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := libLLVM10Support

include $(LLVM10_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(tablegen_global_isel_SRC_FILES)

LOCAL_MODULE:= libLLVM10TableGenGlobalISel

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := libLLVM10Support

include $(LLVM10_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
