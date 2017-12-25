#!/bin/bash
NDK=/home/shz/android-ndk-r12b
SYSROOT=$NDK/platforms/android-24/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
PREFIX=/home/shz/ffmpeg-install
ARCH=aarch64
function build_one
{
./configure \
    --prefix=$PREFIX \
    --disable-debug \
    --disable-shared \
    --enable-static \
    --enable-pthreads \
    --enable-pic \
    --enable-asm \
    --enable-version3 \
    --enable-gpl \
    --disable-muxers \
    --enable-muxer=mp4 \
    --disable-protocols \
    --enable-protocol=file \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-avdevice \
    --disable-programs \
    --disable-network \
    --disable-swresample \
    --disable-avresample \
    --disable-avfilter \
    --disable-swscale \
    --disable-postproc \
    --disable-doc \
    --disable-symver \
    --disable-encoders \
    --disable-decoders \
    --enable-decoder=h264 \
    --disable-muxers \
    --enable-muxer=mp4 \
    --disable-parsers \
    --enable-parser=h264 \
    --disable-devices \
    --disable-filters \
    --disable-iconv \
    --disable-audiotoolbox \
    --disable-videotoolbox \
    --enable-yasm \
    --disable-hwaccels \
    --cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
    --target-os=linux \
    --arch=$ARCH \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-DANDROID -O3 -fpic"
make clean
make
make install
}
CPU=$ARCH
build_one



