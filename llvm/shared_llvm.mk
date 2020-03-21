LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM90Linker \
  libLLVM90ipo \
  libLLVM90DebugInfoDWARF \
  libLLVM90DebugInfoPDB \
  libLLVM90Symbolize \
  libLLVM90DebugInfoMSF \
  libLLVM90DebugInfoCodeView \
  libLLVM90Demangle \
  libLLVM90IRReader \
  libLLVM90BitWriter \
  libLLVM90BitReader \
  libLLVM90BitstreamReader \
  libLLVM90GlobalISel

llvm_arm_static_libraries := \
  libLLVM90ARMCodeGen \
  libLLVM90ARMAsmParser \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMDisassembler \
  libLLVM90ARMUtils

llvm_x86_static_libraries := \
  libLLVM90X86CodeGen \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmParser \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM90AMDGPUCodeGen \
  libLLVM90AMDGPUInfo \
  libLLVM90AMDGPUDesc \
  libLLVM90AMDGPUAsmParser \
  libLLVM90AMDGPUUtils \
  libLLVM90AMDGPUDisassembler
endif

llvm_mips_static_libraries := \
  libLLVM90MipsCodeGen \
  libLLVM90MipsInfo \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmParser \
  libLLVM90MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Info \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM90AsmPrinter \
  libLLVM90SelectionDAG \
  libLLVM90CodeGen \
  libLLVM90Object \
  libLLVM90ScalarOpts \
  libLLVM90AggressiveInstCombine \
  libLLVM90InstCombine \
  libLLVM90Instrumentation \
  libLLVM90TransformObjCARC \
  libLLVM90TransformUtils \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90MCDisassembler \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Option \
  libLLVM90Support \
  libLLVM90Vectorize \
  libLLVM90ProfileData \
  libLLVM90LibDriver \
  libLLVM90BinaryFormat \
  libLLVM90Coroutines \
  libLLVM90Remarks \
  libLLVM90MIRParser

llvm_host_static_libraries := \
  libLLVM90ExecutionEngine \
  libLLVM90RuntimeDyld \
  libLLVM90MCJIT \
  libLLVM90OrcJIT \
  libLLVM90JITLink

llvm_device_static_libraries := \
  libLLVM90ExecutionEngine \
  libLLVM90RuntimeDyld \
  libLLVM90MCJIT \
  libLLVM90JITLink

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM90

LOCAL_MODULE_TAGS := optional

# Host build pulls in all ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries) \
  $(llvm_arm_static_libraries) \
  $(llvm_x86_static_libraries) \
  $(llvm_mips_static_libraries) \
  $(llvm_aarch64_static_libraries) \
  $(llvm_host_static_libraries) \
  $(llvm_post_static_libraries)

LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lole32
LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

# Use prebuilts for linux and darwin unless
# FORCE_BUILD_LLVM_COMPONENTS is true
ifneq (true,$(FORCE_BUILD_LLVM_COMPONENTS))
LOCAL_MODULE_HOST_OS := linux
else
LOCAL_MODULE_HOST_OS := linux
endif

include $(LLVM90_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM90_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM90

LOCAL_MODULE_TAGS := optional

# Device build selectively pulls in ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries)

LOCAL_WHOLE_STATIC_LIBRARIES_arm += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips64 += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_arm_static_libraries)

ifeq ($(BUILD_ARM_FOR_X86),true)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_aarch64_static_libraries)
endif

LOCAL_WHOLE_STATIC_LIBRARIES += \
  $(llvm_device_static_libraries) \
  $(llvm_post_static_libraries)

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/device/include \
  $(call local-generated-sources-dir)

include $(LLVM90_DEVICE_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
