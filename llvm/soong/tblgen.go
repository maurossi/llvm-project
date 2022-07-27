// Copyright (C) 2016 The Android Open Source Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package llvm

import (
	"path/filepath"
	"strings"

	"android/soong/android"
	"android/soong/genrule"

	"github.com/google/blueprint"
)

func init() {
	android.RegisterModuleType("llvm_tblgen", llvmTblgenFactory)
}

var (
	pctx = android.NewPackageContext("android/soong/llvm")

	llvmTblgen = pctx.HostBinToolVariable("llvmTblgen", "llvm-tblgen")

	tblgenRule = pctx.StaticRule("tblgenRule", blueprint.RuleParams{
		Depfile:     "${out}.d",
		Deps:        blueprint.DepsGCC,
		Command:     "${llvmTblgen} ${includes} ${generator} -d ${depfile} -o ${out} ${in}",
		CommandDeps: []string{"${llvmTblgen}"},
		Description: "LLVM TableGen $in => $out",
		Restat:      true,
	}, "includes", "depfile", "generator")
)

type tblgenProperties struct {
	In   string
	Outs []string
}

type tblgen struct {
	android.ModuleBase

	properties tblgenProperties

	exportedHeaderDirs android.Paths
	generatedHeaders   android.Paths
}

var _ genrule.SourceFileGenerator = (*tblgen)(nil)

func (t *tblgen) GenerateAndroidBuildActions(ctx android.ModuleContext) {
	in := android.PathForModuleSrc(ctx, t.properties.In)

	includes := []string{
		"-I " + ctx.ModuleDir(),
		"-I external/llvm-project/llvm/include",
		"-I external/llvm-project/llvm/lib/Target",
		"-I " + filepath.Dir(in.String()),
	}

	for _, o := range t.properties.Outs {
		out := android.PathForModuleGen(ctx, o)
		generator := outToGenerator(ctx, o)

		ctx.ModuleBuild(pctx, android.ModuleBuildParams{
			Rule:   tblgenRule,
			Input:  in,
			Output: out,
			Args: map[string]string{
				"includes":  strings.Join(includes, " "),
				"generator": generator,
			},
		})
		t.generatedHeaders = append(t.generatedHeaders, out)
	}

	t.exportedHeaderDirs = append(t.exportedHeaderDirs, android.PathForModuleGen(ctx, ""))
}

func outToGenerator(ctx android.ModuleContext, out string) string {
	out = filepath.Base(out)
	switch {
	case strings.HasSuffix(out, "GenRegisterInfo.inc"):
		return "-gen-register-info"
	case strings.HasSuffix(out, "GenInstrInfo.inc"):
		return "-gen-instr-info"
	case strings.HasSuffix(out, "GenAsmWriter.inc"):
		return "-gen-asm-writer"
	case strings.HasSuffix(out, "GenAsmWriter1.inc"):
		return "-gen-asm-writer -asmwriternum=1"
	case strings.HasSuffix(out, "GenAsmMatcher.inc"):
		return "-gen-asm-matcher"
	case strings.HasSuffix(out, "GenCodeEmitter.inc"):
		return "-gen-emitter"
	case strings.HasSuffix(out, "GenMCCodeEmitter.inc"):
		return "-gen-emitter"
	case strings.HasSuffix(out, "GenMCPseudoLowering.inc"):
		return "-gen-pseudo-lowering"
	case strings.HasSuffix(out, "GenDAGISel.inc"):
		return "-gen-dag-isel"
	case strings.HasSuffix(out, "GenDisassemblerTables.inc"):
		return "-gen-disassembler"
	case strings.HasSuffix(out, "GenSearchableTables.inc"):
		return "-gen-searchable-tables"
	case strings.HasSuffix(out, "GenSystemOperands.inc"):
		return "-gen-searchable-tables"
	case strings.HasSuffix(out, "GenSystemRegister.inc"):
		return "-gen-searchable-tables"
	case strings.HasSuffix(out, "InstCombineTables.inc"):
		return "-gen-searchable-tables"
	case strings.HasSuffix(out, "GenEDInfo.inc"):
		return "-gen-enhanced-disassembly-info"
	case strings.HasSuffix(out, "GenFastISel.inc"):
		return "-gen-fast-isel"
	case strings.HasSuffix(out, "GenSubtargetInfo.inc"):
		return "-gen-subtarget"
	case strings.HasSuffix(out, "GenCallingConv.inc"):
		return "-gen-callingconv"
	case strings.HasSuffix(out, "GenIntrinsicEnums.inc"):
		return "-gen-intrinsic-enums"
	case strings.HasSuffix(out, "GenIntrinsicImpl.inc"):
		return "-gen-intrinsic-impl"
	case strings.HasSuffix(out, "GenDecoderTables.inc"):
		return "-gen-arm-decoder"
	case strings.HasSuffix(out, "Options.inc"):
		return "-gen-opt-parser-defs"
	case strings.HasSuffix(out, "GenDFAPacketizer.inc"):
		return "-gen-dfa-packetizer"
	case strings.HasSuffix(out, "GenRegisterBank.inc"):
		return "-gen-register-bank"
	case strings.HasSuffix(out, "AArch64GenO0PreLegalizeGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AArch64O0PreLegalizerCombinerHelper\""
	case strings.HasSuffix(out, "AArch64GenPreLegalizeGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AArch64PreLegalizerCombinerHelper\""
	case strings.HasSuffix(out, "AArch64GenPostLegalizeGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AArch64PostLegalizerCombinerHelper\""
	case strings.HasSuffix(out, "AArch64GenPostLegalizeGILowering.inc"):
		return "-gen-global-isel-combiner -combiners=\"AArch64PostLegalizerLoweringHelper\""
	case strings.HasSuffix(out, "AMDGPUGenPreLegalizeGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AMDGPUPreLegalizerCombinerHelper\""
	case strings.HasSuffix(out, "AMDGPUGenPostLegalizeGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AMDGPUPostLegalizerCombinerHelper\""
	case strings.HasSuffix(out, "AMDGPUGenRegBankGICombiner.inc"):
		return "-gen-global-isel-combiner -combiners=\"AMDGPURegBankCombinerHelper\""
	case strings.HasSuffix(out, "GenGlobalISel.inc"):
		return "-gen-global-isel"
	case strings.HasSuffix(out, "X86GenEVEX2VEXTables.inc"):
		return "-gen-x86-EVEX2VEX-tables"
	case out == "Attributes.inc", out == "AttributesCompatFunc.inc":
		return "-gen-attrs"
	case out == "IntrinsicEnums.inc":
		return "-gen-intrinsic-enums"
	case out == "IntrinsicImpl.inc":
		return "-gen-intrinsic-impl"
	case out == "IntrinsicsAArch64.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=aarch64"
	case out == "IntrinsicsAMDGPU.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=amdgcn"
	case out == "IntrinsicsARM.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=arm"
	case out == "IntrinsicsBPF.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=bpf"
	case out == "IntrinsicsDirectX.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=dx"
	case out == "IntrinsicsHexagon.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=hexagon"
	case out == "IntrinsicsMips.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=mips"
	case out == "IntrinsicsNVPTX.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=nvvm"
	case out == "IntrinsicsPowerPC.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=ppc"
	case out == "IntrinsicsR600.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=r600"
	case out == "IntrinsicsRISCV.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=riscv"
	case out == "IntrinsicsS390.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=s390"
	case out == "IntrinsicsWebAssembly.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=wasm"
	case out == "IntrinsicsX86.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=x86"
	case out == "IntrinsicsXCore.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=xcore"
	case out == "IntrinsicsVE.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=ve"
	case out == "ACC.h.inc":
		return "--gen-directive-decl"
	case out == "ACC.inc":
		return "--gen-directive-impl"
	case out == "OMP.h.inc":
		return "--gen-directive-decl"
	case out == "OMP.inc":
		return "--gen-directive-impl"
	}

	ctx.ModuleErrorf("couldn't map output file %q to a generator", out)
	return ""
}

func (t *tblgen) DepsMutator(ctx android.BottomUpMutatorContext) {
}

func (t *tblgen) GeneratedHeaderDirs() android.Paths {
	return t.exportedHeaderDirs
}

func (t *tblgen) GeneratedSourceFiles() android.Paths {
	return nil
}

func (t *tblgen) GeneratedDeps() android.Paths {
	return t.generatedHeaders
}

func llvmTblgenFactory() android.Module {
	t := &tblgen{}
	t.AddProperties(&t.properties)
	android.InitAndroidModule(t)
	return t
}
