ATTRIBUTETD90_LOCAL := $(LLVM90_ROOT_PATH)/lib/IR/AttributesCompatFunc.td

GENFILE_LOCAL := $(addprefix $(call local-generated-sources-dir)/,AttributesCompatFunc.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE_LOCAL)
$(GENFILE_LOCAL): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE_LOCAL): $(ATTRIBUTETD90_LOCAL) | $(LLVM90_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out90,attrs)
else
	$(call transform-device-td-to-out90,attrs)
endif
