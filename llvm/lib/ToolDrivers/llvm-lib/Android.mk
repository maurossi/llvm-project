LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES10 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES10 := $(LibDriver_TBLGEN_TABLES10)

LOCAL_MODULE:= libLLVM10LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES10 := $(LibDriver_TBLGEN_TABLES10)

LOCAL_MODULE:= libLLVM10LibDriver

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_TBLGEN_RULES_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
