#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH:= $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM10_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS10)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM10Linker \
  libLLVM10ipo \
  libLLVM10DebugInfoDWARF \
  libLLVM10DebugInfoPDB \
  libLLVM10IRReader \
  libLLVM10BitWriter \
  libLLVM10BitReader \
  libLLVM10ARMCodeGen \
  libLLVM10ARMAsmParser \
  libLLVM10ARMAsmPrinter \
  libLLVM10ARMInfo \
  libLLVM10ARMDesc \
  libLLVM10ARMDisassembler \
  libLLVM10MipsCodeGen \
  libLLVM10MipsInfo \
  libLLVM10MipsDesc \
  libLLVM10MipsAsmParser \
  libLLVM10MipsAsmPrinter \
  libLLVM10MipsDisassembler \
  libLLVM10X86CodeGen \
  libLLVM10X86Info \
  libLLVM10X86Desc \
  libLLVM10X86AsmParser \
  libLLVM10X86AsmPrinter \
  libLLVM10X86Utils \
  libLLVM10X86Disassembler \
  libLLVM10AArch64CodeGen \
  libLLVM10AArch64Info \
  libLLVM10AArch64Desc \
  libLLVM10AArch64AsmParser \
  libLLVM10AArch64AsmPrinter \
  libLLVM10AArch64Utils \
  libLLVM10AArch64Disassembler \
  libLLVM10ExecutionEngine \
  libLLVM10RuntimeDyld \
  libLLVM10MCJIT \
  libLLVM10OrcJIT \
  libLLVM10AsmPrinter \
  libLLVM10SelectionDAG \
  libLLVM10CodeGen \
  libLLVM10Object \
  libLLVM10ScalarOpts \
  libLLVM10InstCombine \
  libLLVM10Instrumentation \
  libLLVM10TransformObjCARC \
  libLLVM10TransformUtils \
  libLLVM10Vectorize \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10MCDisassembler \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10Core \
  libLLVM10AsmParser \
  libLLVM10Option \
  libLLVM10LTO \
  libLLVM10Support \
  libLLVM10ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
