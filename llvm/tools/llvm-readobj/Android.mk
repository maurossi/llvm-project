LOCAL_PATH := $(call my-dir)

LLVM90_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-readobj command line tool
#===---------------------------------------------------------------===

llvm_readobj_SRC_FILES := \
  ARMAttributeParser.cpp \
  ARMWinEHPrinter.cpp \
  COFFDumper.cpp \
  COFFImportDumper.cpp \
  ELFDumper.cpp \
  Error.cpp \
  llvm-readobj.cpp \
  MachODumper.cpp \
  ObjDumper.cpp \
  StreamWriter.cpp \
  Win64EHDumper.cpp \

llvm_readobj_STATIC_LIBRARIES := \
  libLLVM90ARMInfo \
  libLLVM90AArch64Info \
  libLLVM90MipsInfo \
  libLLVM90X86Info \
  libLLVM90Object \
  libLLVM90BitReader \
  libLLVM90MC \
  libLLVM90MCParser \
  libLLVM90Core \
  libLLVM90Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-readobj
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_readobj_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_readobj_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM90_ROOT_PATH)/llvm.mk
include $(LLVM90_HOST_BUILD_MK)
include $(LLVM90_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
