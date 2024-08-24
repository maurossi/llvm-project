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
	android.RegisterModuleType("llvm_min_tblgen", llvmMinTblgenFactory)
}

var (
	min_tblgen_pctx = android.NewPackageContext("android/soong/llvm_min_tblgen")

	llvmMinTblgen = min_tblgen_pctx.HostBinToolVariable("llvmMinTblgen", "llvm-min-tblgen")

	min_tblgenRule = min_tblgen_pctx.StaticRule("min_tblgenRule", blueprint.RuleParams{
		Depfile:     "${out}.d",
		Deps:        blueprint.DepsGCC,
		Command:     "${llvmMinTblgen} ${includes} ${generator} -d ${depfile} -o ${out} ${in}",
		CommandDeps: []string{"${llvmMinTblgen}"},
		Description: "LLVM Min TableGen $in => $out",
		Restat:      true,
	}, "includes", "depfile", "generator")
)

type min_tblgenProperties struct {
	In   string
	Outs []string
}

type min_tblgen struct {
	android.ModuleBase

	properties min_tblgenProperties

	exportedHeaderDirs android.Paths
	generatedHeaders   android.Paths
}

var _ genrule.SourceFileGenerator = (*min_tblgen)(nil)

func (t *min_tblgen) GenerateAndroidBuildActions(ctx android.ModuleContext) {
	in := android.PathForModuleSrc(ctx, t.properties.In)

	includes := []string{
		"-I " + ctx.ModuleDir(),
		"-I external/llvm-project/llvm/include",
		"-I external/llvm-project/llvm/lib/Target",
		"-I " + filepath.Dir(in.String()),
	}

	for _, o := range t.properties.Outs {
		out := android.PathForModuleGen(ctx, o)
		generator := min_tblgen_outToGenerator(ctx, o)

		ctx.ModuleBuild(min_tblgen_pctx, android.ModuleBuildParams{
			Rule:   min_tblgenRule,
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

func min_tblgen_outToGenerator(ctx android.ModuleContext, out string) string {
	out = filepath.Base(out)
	switch {
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
	case out == "IntrinsicsLoongArch.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=loongarch"
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
	case out == "IntrinsicsSPIRV.h":
		return "-gen-intrinsic-enums -intrinsic-prefix=spv"
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
	case out == "GenVT.inc":
		return "--gen-vt"
	case strings.HasSuffix(out, "RISCVTargetParserDef.inc"):
		return "-gen-riscv-target-def"
	}

	ctx.ModuleErrorf("couldn't map output file %q to a generator", out)
	return ""
}

func (t *min_tblgen) DepsMutator(ctx android.BottomUpMutatorContext) {
}

func (t *min_tblgen) GeneratedHeaderDirs() android.Paths {
	return t.exportedHeaderDirs
}

func (t *min_tblgen) GeneratedSourceFiles() android.Paths {
	return nil
}

func (t *min_tblgen) GeneratedDeps() android.Paths {
	return t.generatedHeaders
}

func llvmMinTblgenFactory() android.Module {
	t := &min_tblgen{}
	t.AddProperties(&t.properties)
	android.InitAndroidModule(t)
	return t
}
