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

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM90_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS90)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM90Linker \
  libLLVM90ipo \
  libLLVM90DebugInfoDWARF \
  libLLVM90DebugInfoPDB \
  libLLVM90IRReader \
  libLLVM90BitWriter \
  libLLVM90BitReader \
  libLLVM90ARMCodeGen \
  libLLVM90ARMAsmParser \
  libLLVM90ARMAsmPrinter \
  libLLVM90ARMInfo \
  libLLVM90ARMDesc \
  libLLVM90ARMDisassembler \
  libLLVM90MipsCodeGen \
  libLLVM90MipsInfo \
  libLLVM90MipsDesc \
  libLLVM90MipsAsmParser \
  libLLVM90MipsAsmPrinter \
  libLLVM90MipsDisassembler \
  libLLVM90X86CodeGen \
  libLLVM90X86Info \
  libLLVM90X86Desc \
  libLLVM90X86AsmParser \
  libLLVM90X86AsmPrinter \
  libLLVM90X86Utils \
  libLLVM90X86Disassembler \
  libLLVM90AArch64CodeGen \
  libLLVM90AArch64Info \
  libLLVM90AArch64Desc \
  libLLVM90AArch64AsmParser \
  libLLVM90AArch64AsmPrinter \
  libLLVM90AArch64Utils \
  libLLVM90AArch64Disassembler \
  libLLVM90ExecutionEngine \
  libLLVM90RuntimeDyld \
  libLLVM90MCJIT \
  libLLVM90OrcJIT \
  libLLVM90AsmPrinter \
  libLLVM90SelectionDAG \
  libLLVM90CodeGen \
  libLLVM90Object \
  libLLVM90ScalarOpts \
  libLLVM90InstCombine \
  libLLVM90Instrumentation \
  libLLVM90TransformObjCARC \
  libLLVM90TransformUtils \
  libLLVM90Vectorize \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90MCDisassembler \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90AsmParser \
  libLLVM90Option \
  libLLVM90LTO \
  libLLVM90Support \
  libLLVM90ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
