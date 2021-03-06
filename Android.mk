#
# Copyright (C) 2012 The CyanogenMod Project 
#               2017 The FuryDragons Project
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
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_SRC_FILES += $(call all-java-files-under, libs/android-syntax-highlight/src)
LOCAL_SRC_FILES += $(call all-java-files-under, libs/color-picker-view/src)

uicommon_dir := ../../../external/uicommon

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
        $(LOCAL_PATH)/$(uicommon_dir)/res

LOCAL_AAPT_FLAGS := \
        --auto-add-overlay \
        --extra-packages com.cyngn.uicommon

LOCAL_STATIC_JAVA_LIBRARIES += libtruezip
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += juniversalchardet
LOCAL_STATIC_JAVA_LIBRARIES += uicommon

LOCAL_PACKAGE_NAME := DragonFileManager
LOCAL_CERTIFICATE := platform
LOCAL_PROGUARD_FLAG_FILES := proguard.flags

include $(BUILD_PACKAGE)
include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    juniversalchardet:libs/juniversalchardet/juniversalchardet-1.0.3.jar

include $(BUILD_MULTI_PREBUILT)
include $(call all-makefiles-under,$(LOCAL_PATH))
