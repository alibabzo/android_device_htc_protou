# Copyright (C) 2011 The Android Open Source Project
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

# proprietary side of the device
# Inherit from those products. Most specific first

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# inherit all the stuff from vendor
$(call inherit-product-if-exists, vendor/htc/protou/vendor_protou.mk)

# Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

# Graphics 
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libgenlock \
    liboverlay \
    libtilerenderer \
    libqdMetaData
    
# Audio
#PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.conf \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    lights.protou \
    gps.msm7x27a \
    librpc \
    power.msm7x27a \
    com.android.future.usb.accessory \
    libnetcmdiface \
    HwaSettings
    
# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27a \
    libsurfaceflinger_client

# Video decoding
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libstagefrighthw \
    libOmxCore \
    libdashplayer

# Bluetooh
PRODUCT_PACKAGES += \
    brcm_patchram_plus

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk
    
# Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.protou:root/fstab.protou \
    $(LOCAL_PATH)/ramdisk/init.protou.rc:root/init.protou.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.protou.rc:root/ueventd.protou.rc \
    $(LOCAL_PATH)/ramdisk/init.protou.usb.rc:root/init.protou.usb.rc
    
# Camera
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/lib/hw/vendor-camera.default.so:system/lib/hw/vendor-camera.default.so \
    device/htc/protou/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/protou/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml
    
# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1 \
    ro.adb.secure=0

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 

# WiFi
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/protou/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/protou/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/htc/protou/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/htc/protou/prebuilt/etc/firmware/fw_bcm4330_b2.bin:system/etc/firmware/fw_bcm4330_b2.bin \
    device/htc/protou/prebuilt/etc/firmware/fw_bcm4330_apsta_b2.bin:system/etc/firmware/fw_bcm4330_apsta_b2.bin \
    device/htc/protou/prebuilt/etc/firmware/fw_bcm4330_p2p_b2.bin:system/etc/firmware/fw_bcm4330_p2p_b2.bin \
    device/htc/protou/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf
    
# Audio
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/protou/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/htc/protou/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/protou/prebuilt/etc/AudioPara4.csv:system/etc/AudioPara4.csv \
    device/htc/protou/prebuilt/etc/AudioPara4_WB.csv:system/etc/AudioPara4_WB.csv \
    device/htc/protou/prebuilt/etc/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    device/htc/protou/prebuilt/etc/AudioFilter_HP.csv:system/etc/AudioFilter_HP.csv \
    device/htc/protou/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/htc/protou/prebuilt/lib/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    device/htc/protou/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

#    device/htc/protou/prebuilt/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
#    device/htc/protou/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so

# 3D(ICS Blobs)
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/protou/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/protou/prebuilt/etc/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg

# Bluetooth
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd:system/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd

# Misc Blobs
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/bin/bma150_usr:system/bin/bma150_usr \
    device/htc/protou/prebuilt/bin/htc_ebdlogd:system/bin/htc_ebdlogd \
    device/htc/protou/prebuilt/bin/logcat2:system/bin/logcat2

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/protou/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/protou/prebuilt/usr/keychars/protou-keypad.kcm.bin:system/usr/keychars/protou-keypad.kcm.bin \
    device/htc/protou/prebuilt/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/protou/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/protou/prebuilt/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/protou/prebuilt/usr/keylayout/protou-keypad.kl:system/usr/keylayout/protou-keypad.kl \
    device/htc/protou/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/protou/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/protou/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/protou/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/protou/prebuilt/usr/idc/protou-keypad.idc:system/usr/idc/protou-keypad.idc \
    device/htc/protou/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/protou/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=50 \
    persist.sys.purgeable_assets=1 \
    ro.telephony.call_ring.delay=3000 \
    ro.config.low_ram=true

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_TAGS += dalvik.gc.type-precise
