#!/bin/bash
NDK=/home/shz/android-ndk-r12b
SYSROOT=$NDK/platforms/android-24/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
PREFIX=/home/shz/ffmpeg-install
ARCH=aarch64
function build_arm64
{
./configure \
--prefix=./android/arm64-v8a \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
--target-os=linux \
--arch=$ARCH \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}
build_arm64


echo Android ARM64 builds finished
