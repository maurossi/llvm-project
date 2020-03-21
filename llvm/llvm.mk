ifeq ($(LLVM90_ROOT_PATH),)
$(error Must set variable LLVM90_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS90 := $(LLVM90_ROOT_PATH)/clear_tblgen_vars.mk
LLVM90_HOST_BUILD_MK := $(LLVM90_ROOT_PATH)/llvm-host-build.mk
LLVM90_DEVICE_BUILD_MK := $(LLVM90_ROOT_PATH)/llvm-device-build.mk
LLVM90_GEN_ATTRIBUTES_MK := $(LLVM90_ROOT_PATH)/llvm-gen-attributes.mk
LLVM90_GEN_INTRINSICS_MK := $(LLVM90_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM90_TBLGEN_RULES_MK := $(LLVM90_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM90_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
