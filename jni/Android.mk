LOCAL_PATH := $(call my-dir)/../src/lib_json

include $(CLEAR_VARS)

LOCAL_MODULE := jsoncpp
LOCAL_CPPFLAGS :=  -fexceptions

LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
LOCAL_SRC_FILES := $(LOCAL_SRC_FILES:$(LOCAL_PATH)/%=%)

$(info ================)
$(info $(LOCAL_PATH))
$(info $(LOCAL_SRC_FILES))
$(info ================)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../include

include $(BUILD_STATIC_LIBRARY)