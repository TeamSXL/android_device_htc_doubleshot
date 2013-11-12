# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2013 Emmanuel Utomi
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# Inherit Recovery flags
-include device/htc/doubleshot/recovery/BoardConfigRecovery.mk

COMMON_GLOBAL_CPPFLAGS += -DCM_HARDWARE

# Audio
BOARD_HAVE_HTC_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := doubleshot

# Graphics
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Kernel [Settings]
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.selinux=permissive

# Kernel [Build]
TARGET_KERNEL_CONFIG := doubleshot_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/doubleshot
BUILD_KERNEL := true
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := codefirex-arm-eabi-4.7

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := doubleshot

# RIL
# BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true

# Wifi
-include device/htc/msm8660-common/bcmdhd.mk

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144

#Recovery
TARGET_PROVIDES_INIT := true
TARGET_RECOVERY_FSTAB := device/htc/doubleshot/ramdisk/fstab.doubleshot
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_INITRC := device/htc/doubleshot/recovery/init.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/htc/doubleshot/recovery/default_recovery_keys.c
BOARD_USES_MMCUTILS := true
