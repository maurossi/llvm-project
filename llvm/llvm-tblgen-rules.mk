###########################################################
## Commands for running tblgen to compile a td file
##########################################################
define transform-td-to-out10
$(if $(LOCAL_IS_HOST_MODULE),	\
	$(call transform-host-td-to-out10,$(1)),	\
	$(call transform-device-td-to-out10,$(1)))
endef

###########################################################
## TableGen: Compile .td files to .inc.
###########################################################

# Set LOCAL_MODULE_CLASS to STATIC_LIBRARIES default (require
# for macro local-generated-sources-dir)
ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

ifneq ($(strip $(TBLGEN_TABLES10)),)

generated_sources := $(call local-generated-sources-dir)
tblgen_gen_tables := $(addprefix $(generated_sources)/,$(TBLGEN_TABLES10))
LOCAL_GENERATED_SOURCES += $(tblgen_gen_tables)

tblgen_source_dir := $(LOCAL_PATH)
ifneq ($(TBLGEN_TD_DIR10),)
tblgen_source_dir := $(TBLGEN_TD_DIR10)
endif

ifneq (,$(filter $(tblgen_source_dir),MCTargetDesc))
tblgen_td_deps := $(tblgen_source_dir)/../*.td
else
tblgen_td_deps := $(tblgen_source_dir)/*.td
endif
tblgen_td_deps := $(wildcard $(tblgen_td_deps))

#
# The directory and the .td directory is not the same.
#
ifeq ($(tblgen_source_dir),$(LLVM10_ROOT_PATH)/lib/Target/ARM/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,subtarget)
endif

ifeq ($(tblgen_source_dir),$(LLVM10_ROOT_PATH)/lib/Target/X86/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,subtarget)
endif

ifeq ($(tblgen_source_dir),$(LLVM10_ROOT_PATH)/lib/Target/Mips/MCTargetDesc)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/../%.td \
                                       $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10, register-info)

$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/../%.td \
                                    $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,instr-info)

$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/../%.td \
                                        $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,subtarget)
endif

ifneq ($(filter %GenRegisterInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/%.td \
                                       $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,register-info)
endif

ifneq ($(filter %GenInstrInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/%.td \
                                    $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,instr-info)
endif

ifneq ($(filter %GenAsmWriter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter.inc: $(tblgen_source_dir)/%.td \
                                    $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,asm-writer)
endif

ifneq ($(filter %GenAsmWriter1.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter1.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter1.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,asm-writer -asmwriternum=1)
endif

ifneq ($(filter %GenAsmMatcher.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmMatcher.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmMatcher.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,asm-matcher)
endif

# TODO(srhines): Is this needed
ifneq ($(filter %GenCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCodeEmitter.inc: $(tblgen_source_dir)/%.td \
                                      $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,emitter)
endif

ifneq ($(filter %GenMCCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCCodeEmitter.inc: $(tblgen_source_dir)/%.td \
                                        $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,emitter)
endif

ifneq ($(filter %GenMCPseudoLowering.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCPseudoLowering.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCPseudoLowering.inc: $(tblgen_source_dir)/%.td \
                                           $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,pseudo-lowering)
endif

ifneq ($(filter %GenDAGISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDAGISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDAGISel.inc: $(tblgen_source_dir)/%.td \
                                  $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,dag-isel)
endif

ifneq ($(filter %GenRegisterBank.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterBank.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterBank.inc: $(tblgen_source_dir)/%.td \
                                  $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,register-bank)
endif

ifneq ($(filter %GenDisassemblerTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDisassemblerTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDisassemblerTables.inc: $(tblgen_source_dir)/%.td \
                                             $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,disassembler)
endif

ifneq ($(filter %GenEDInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenEDInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenEDInfo.inc: $(tblgen_source_dir)/%.td \
                                 $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,enhanced-disassembly-info)
endif

ifneq ($(filter %GenFastISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenFastISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenFastISel.inc: $(tblgen_source_dir)/%.td \
                                   $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,fast-isel)
endif

ifneq ($(filter %GenGlobalISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenGlobalISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenGlobalISel.inc: $(tblgen_source_dir)/%.td \
                                   $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,global-isel)
endif

ifneq ($(filter %GenSubtargetInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/%.td \
                                        $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,subtarget)
endif

ifneq ($(filter %GenCallingConv.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCallingConv.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCallingConv.inc: $(tblgen_source_dir)/%.td \
                                      $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,callingconv)
endif

ifneq ($(filter %GenIntrinsicEnums.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenIntrinsicEnums.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenIntrinsicEnums.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,tgt-intrinsic-enums)
endif

ifneq ($(filter %GenIntrinsicImpl.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenIntrinsicImpl.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenIntrinsicImpl.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,tgt-intrinsic-impl)
endif

ifneq ($(filter %GenSearchableTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSearchableTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSearchableTables.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,searchable-tables)
endif

ifneq ($(filter %GenSystemOperands.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSystemOperands.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSystemOperands.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,searchable-tables)
endif

ifneq ($(filter %GenDFAPacketizer.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDFAPacketizer.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDFAPacketizer.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) | $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,dfa-packetizer)
endif

ifneq ($(filter %GenExegesis.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenExegesis.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenExegesis.inc: $(tblgen_source_dir)/%.td \
                                     $(tblgen_td_deps) | $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,exegesis)
endif

ifneq ($(findstring ARMGenDecoderTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenDecoderTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenDecoderTables.inc: $(tblgen_source_dir)/ARM.td \
                                          $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,arm-decoder)
endif

ifneq ($(findstring ARMGenSystemRegister.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenSystemRegister.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenSystemRegister.inc: $(tblgen_source_dir)/ARM.td \
                                          $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,searchable-tables)
endif

ifneq ($(findstring InstCombineTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/InstCombineTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/InstCombineTables.inc: $(tblgen_source_dir)/InstCombineTables.td \
                                          $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,searchable-tables)
endif

ifneq ($(findstring Options.inc,$(tblgen_gen_tables)),)
$(generated_sources)/Options.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/Options.inc: $(tblgen_source_dir)/Options.td \
                                     $(tblgen_td_deps) \
                                     $(LLVM10_TBLGEN) \
                                     $(LLVM10_ROOT_PATH)/include/llvm/Option/OptParser.td
	$(call transform-td-to-out10,opt-parser-defs)
endif

ifneq ($(findstring X86GenEVEX2VEXTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/X86GenEVEX2VEXTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/X86GenEVEX2VEXTables.inc: $(tblgen_source_dir)/X86.td \
                                          $(tblgen_td_deps) $(LLVM10_TBLGEN)
	$(call transform-td-to-out10,x86-EVEX2VEX-tables)
endif

# Reset local variables
tblgen_td_deps :=

endif
