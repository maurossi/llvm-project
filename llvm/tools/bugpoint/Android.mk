LOCAL_PATH := $(call my-dir)

LLVM10_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM10BitWriter \
  libLLVM10CodeGen \
  libLLVM10ipo \
  libLLVM10IRReader \
  libLLVM10BitReader \
  libLLVM10AsmParser \
  libLLVM10InstCombine \
  libLLVM10Instrumentation \
  libLLVM10Linker \
  libLLVM10TransformObjCARC \
  libLLVM10Object \
  libLLVM10ScalarOpts \
  libLLVM10TransformUtils \
  libLLVM10Analysis \
  libLLVM10Target \
  libLLVM10Core \
  libLLVM10MC \
  libLLVM10MCParser \
  libLLVM10ProfileData \
  libLLVM10Vectorize \
  libLLVM10Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM10_ROOT_PATH)/llvm.mk
include $(LLVM10_HOST_BUILD_MK)
include $(LLVM10_GEN_ATTRIBUTES_MK)
include $(LLVM10_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
