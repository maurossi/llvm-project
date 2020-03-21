LOCAL_PATH := $(call my-dir)

object_yaml_SRC_FILES := \
  CodeViewYAMLTypes.cpp \
  CodeViewYAMLSymbols.cpp \
  CodeViewYAMLDebugSections.cpp \
  COFFYAML.cpp \
  DWARFEmitter.cpp \
  DWARFVisitor.cpp \
  DWARFYAML.cpp \
  ELFYAML.cpp \
  MachOYAML.cpp \
  ObjectYAML.cpp \
  WasmYAML.cpp \
  YAML.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM90ObjectYAML
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(object_yaml_SRC_FILES)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM90ObjectYAML

LOCAL_SRC_FILES := $(object_yaml_SRC_FILES)

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
