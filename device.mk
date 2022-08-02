#
# Copyright (C) 2010 The Android Open Source Project
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

$(call inherit-product, hardware/nvidia/tegra3/tegra3.mk)

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Dalvik VM config
$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

# Rootdir files
PRODUCT_COPY_FILES += \
    device/lge/p895/rootdir/fstab.p895:root/fstab.p895 \
    device/lge/p895/rootdir/init.p895.rc:root/init.p895.rc \
    device/lge/p895/rootdir/init.p895.usb.rc:root/init.p895.usb.rc \
    device/lge/p895/rootdir/ueventd.p895.rc:root/ueventd.p895.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Input device configs
PRODUCT_COPY_FILES += \
    device/lge/p895/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lge/p895/keylayout/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
    device/lge/p895/keylayout/tegra-snd-max98088.kl:system/usr/keylayout/tegra-snd-max98088.kl \
    device/lge/p895/keylayout/touch_dev.idc:system/usr/keylayout/touch_dev.idc \
    device/lge/p895/keylayout/touch_dev.kl:system/usr/keylayout/touch_dev.kl

DEVICE_PACKAGE_OVERLAYS += \
    device/lge/p895/overlay

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

PRODUCT_COPY_FILES += \
    device/lge/p895/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# Light HAL
PRODUCT_PACKAGES += \
    lights.p895

# Audio HAL
PRODUCT_PACKAGES += \
    audio.primary.p895 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_COPY_FILES += \
    device/lge/p895/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/lge/p895/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# GPS
PRODUCT_COPY_FILES += \
    device/lge/p895/gps/lge.cer:system/etc/cert/lge.cer \
    device/lge/p895/gps/gps.conf:system/etc/gps.conf \
    device/lge/p895/gps/hmconfig.txt:system/etc/hmconfig.txt

# NFC
PRODUCT_PACKAGES += \
    nfc.p895 \
    libpn544_fw \
    NfcNxp \
    Tag

# Filesystem management tools
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs

# Shell
ifneq ($(filter eng userdebug,$(TARGET_BUILD_VARIANT)),)
PRODUCT_PACKAGES += \
    Terminal
endif

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/lge/p895/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/p895/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/lge/p895/media/nvcamera.conf:system/etc/nvcamera.conf

# Vendor blobs
$(call inherit-product-if-exists, vendor/lge/p895/lge-vendor.mk)
$(call inherit-product-if-exists, vendor/broadcom/p895/broadcom-vendor.mk)
