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

LOCAL_PATH := $(call my-dir)

libfuzzer_srcs := \
      FuzzerCrossOver.cpp \
      FuzzerDriver.cpp \
      FuzzerExtFunctionsDlsym.cpp \
      FuzzerExtFunctionsDlsymWin.cpp \
      FuzzerExtFunctionsWeak.cpp \
      FuzzerExtraCounters.cpp \
      FuzzerIO.cpp \
      FuzzerIOPosix.cpp \
      FuzzerIOWindows.cpp \
      FuzzerLoop.cpp \
      FuzzerMerge.cpp \
      FuzzerMutate.cpp \
      FuzzerSHA1.cpp \
      FuzzerShmemPosix.cpp \
      FuzzerShmemWindows.cpp \
      FuzzerTracePC.cpp \
      FuzzerTraceState.cpp \
      FuzzerUtil.cpp \
      FuzzerUtilDarwin.cpp \
      FuzzerUtilLinux.cpp \
      FuzzerUtilPosix.cpp \
      FuzzerUtilWindows.cpp

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_MODULE := libLLVM10FuzzerNoMain
LOCAL_C_INCLUDES := external/compiler-rt/include
LOCAL_SRC_FILES := $(libfuzzer_srcs)
LOCAL_SANITIZE := never
LOCAL_MULTILIB := both
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_MODULE := libLLVM10Fuzzer
LOCAL_SRC_FILES := FuzzerMain.cpp
LOCAL_WHOLE_STATIC_LIBRARIES := libLLVM10FuzzerNoMain
LOCAL_SANITIZE := never
LOCAL_MULTILIB := both
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_MODULE := libLLVM10FuzzerNoMain
LOCAL_C_INCLUDES := external/compiler-rt/include
LOCAL_SRC_FILES := $(libfuzzer_srcs)
LOCAL_SANITIZE := never
LOCAL_MULTILIB := both
include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_MODULE := libLLVM10Fuzzer
LOCAL_SRC_FILES := FuzzerMain.cpp
LOCAL_WHOLE_STATIC_LIBRARIES := libLLVM10FuzzerNoMain
LOCAL_SANITIZE := never
LOCAL_MULTILIB := both
include $(BUILD_HOST_STATIC_LIBRARY)
