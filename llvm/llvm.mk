ifeq ($(LLVM10_ROOT_PATH),)
$(error Must set variable LLVM10_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS10 := $(LLVM10_ROOT_PATH)/clear_tblgen_vars.mk
LLVM10_HOST_BUILD_MK := $(LLVM10_ROOT_PATH)/llvm-host-build.mk
LLVM10_DEVICE_BUILD_MK := $(LLVM10_ROOT_PATH)/llvm-device-build.mk
LLVM10_GEN_ATTRIBUTES_MK := $(LLVM10_ROOT_PATH)/llvm-gen-attributes.mk
LLVM10_GEN_INTRINSICS_MK := $(LLVM10_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM10_TBLGEN_RULES_MK := $(LLVM10_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM10_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
