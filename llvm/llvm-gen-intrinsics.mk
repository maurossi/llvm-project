# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD10 := $(LLVM10_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTD10S := $(wildcard $(dir $(INTRINSICTD10))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicEnums.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums)
else
	$(call transform-device-td-to-out10,intrinsic-enums)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicImpl.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-impl)
else
	$(call transform-device-td-to-out10,intrinsic-impl)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsAArch64.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=aarch64)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=aarch64)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsAMDGPU.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=amdgcn)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=amdgcn)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsARM.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=arm)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=arm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsBPF.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=bpf)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=bpf)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsHexagon.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=hexagon)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=hexagon)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsMips.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=mips)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=mips)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsNVPTX.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=nvvm)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=nvvm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsPowerPC.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=ppc)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=ppc)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsR600.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=r600)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=r600)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsRISCV.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=riscv)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=riscv)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsS390.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=s390)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=s390)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsWebAssembly.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=wasm)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=wasm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsX86.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=x86)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=x86)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsXCore.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD10) $(INTRINSICTD10S) | $(LLVM10_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out10,intrinsic-enums -intrinsic-prefix=xcore)
else
	$(call transform-device-td-to-out10,intrinsic-enums -intrinsic-prefix=xcore)
endif
