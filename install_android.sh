set -x

rm -rf buildscons
TOOLCHAIN_BASE=${1:-/tmp/my-android-toolchain/}
COMPILER_PREFIX=${2:-arm-linux-androideabi}
INSTALL_PREFIX=${3:-/opt/arm-tools}

TOOLCHAIN_BIN=$TOOLCHAIN_BASE/bin/

TOOLCHAIN_PREFIX=$TOOLCHAIN_BIN$COMPILER_PREFIX
export CPP=${TOOLCHAIN_PREFIX}-cpp
export AR=${TOOLCHAIN_PREFIX}-ar
export AS=${TOOLCHAIN_PREFIX}-as
export NM=${TOOLCHAIN_PREFIX}-nm
export CC=${TOOLCHAIN_PREFIX}-g++
export CXX=${TOOLCHAIN_PREFIX}-g++
export LD=${TOOLCHAIN_PREFIX}-ld
export RANLIB=${TOOLCHAIN_PREFIX}-ranlib
export TOOLCHAIN_BASE=$TOOLCHAIN_BASE

CXXFLAGS='-fPIC' scons platform=android
cp ./libs/android/libjson_android_libmt.a $INSTALL_PREFIX/lib
cp -r ./include/json $INSTALL_PREFIX/include/
