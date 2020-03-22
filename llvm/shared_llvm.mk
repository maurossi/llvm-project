LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM10Linker \
  libLLVM10ipo \
  libLLVM10DebugInfoDWARF \
  libLLVM10DebugInfoPDB \
  libLLVM10Symbolize \
  libLLVM10DebugInfoMSF \
  libLLVM10DebugInfoCodeView \
  libLLVM10Demangle \
  libLLVM10IRReader \
  libLLVM10BitWriter \
  libLLVM10BitReader \
  libLLVM10BitstreamReader \
  libLLVM10GlobalISel \
  libLLVM10Passes

llvm_arm_static_libraries := \
  libLLVM10ARMCodeGen \
  libLLVM10ARMAsmParser \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMDisassembler \
  libLLVM10ARMUtils

llvm_x86_static_libraries := \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmParser \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM10AMDGPUCodeGen \
  libLLVM10AMDGPUInfo \
  libLLVM10AMDGPUDesc \
  libLLVM10AMDGPUAsmParser \
  libLLVM10AMDGPUUtils \
  libLLVM10AMDGPUDisassembler
endif

llvm_mips_static_libraries := \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmParser \
  libLLVM10MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10Object \
  libLLVM10ScalarOpts \
  libLLVM10AggressiveInstCombine \
  libLLVM10InstCombine \
  libLLVM10Instrumentation \
  libLLVM10TransformObjCARC \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10MCDisassembler \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10Support \
  libLLVM10Vectorize \
  libLLVM10ProfileData \
  libLLVM10LibDriver \
  libLLVM10BinaryFormat \
  libLLVM10Coroutines \
  libLLVM10Remarks \
  libLLVM10MIRParser \
  libLLVM10TextAPI \
  libLLVM10CFGuard

llvm_host_static_libraries := \
  libLLVM10ExecutionEngine \
  libLLVM10RuntimeDyld \
  libLLVM10MCJIT \
  libLLVM10OrcJIT \
  libLLVM10OrcError \
  libLLVM10JITLink

llvm_device_static_libraries := \
  libLLVM10ExecutionEngine \
  libLLVM10RuntimeDyld \
  libLLVM10MCJIT \
  libLLVM10OrcJIT \
  libLLVM10OrcError \
  libLLVM10JITLink

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM10

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

include $(LLVM10_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM10_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM10

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

include $(LLVM10_DEVICE_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
