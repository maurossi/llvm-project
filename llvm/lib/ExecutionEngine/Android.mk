LOCAL_PATH:= $(call my-dir)

executionengine_SRC_FILES := \
	ExecutionEngineBindings.cpp \
	ExecutionEngine.cpp \
	GDBRegistrationListener.cpp \
	SectionMemoryManager.cpp \
	TargetSelect.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM10ExecutionEngine
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(executionengine_SRC_FILES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM10ExecutionEngine
LOCAL_SRC_FILES := $(executionengine_SRC_FILES)

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
