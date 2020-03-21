LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# bugpoint command line tool
#===---------------------------------------------------------------===

bugpoint_SRC_FILES := \
  BugDriver.cpp       \
  CrashDebugger.cpp   \
  ExecutionDriver.cpp \
  ExtractFunction.cpp \
  FindBugs.cpp        \
  Miscompilation.cpp  \
  OptimizerDriver.cpp \
  ToolRunner.cpp      \
  bugpoint.cpp        \

bugpoint_STATIC_LIBRARIES := \
  libLLVM90BitWriter \
  libLLVM90CodeGen \
  libLLVM90ipo \
  libLLVM90IRReader \
  libLLVM90BitReader \
  libLLVM90AsmParser \
  libLLVM90InstCombine \
  libLLVM90Instrumentation \
  libLLVM90Linker \
  libLLVM90TransformObjCARC \
  libLLVM90Object \
  libLLVM90ScalarOpts \
  libLLVM90TransformUtils \
  libLLVM90Analysis \
  libLLVM90Target \
  libLLVM90Core \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90ProfileData \
  libLLVM90Vectorize \
  libLLVM90Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_ATTRIBUTES_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
