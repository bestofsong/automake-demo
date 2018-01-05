#! /bin/sh

cmd_name=`which $0`
if [ "x`echo $cmd_name | grep -e '^/'`" = "x" ] ; then
  script_path=`pwd`/$cmd_name
else
  script_path=$cmd_name
fi
script_dir=`dirname "${script_path}"`

PROJ_ROOT=`dirname "${script_dir}"`
BUILD_DIR=${PROJ_ROOT}/build
CONFIGURE=${PROJ_ROOT}/configure

dobuild() {
  export CC="$(xcrun -find -sdk ${SDK} cc)"
  export CXX="$(xcrun -find -sdk ${SDK} cxx)"
  export CPP="$(xcrun -find -sdk ${SDK} cpp)"
  export CFLAGS="${HOST_FLAGS} ${OPT_FLAGS}"
  export CXXFLAGS="${HOST_FLAGS} ${OPT_FLAGS}"
  export LDFLAGS="${HOST_FLAGS}"

  ${CONFIGURE} --host=${CHOST} --prefix=${PREFIX} --enable-static --disable-shared

  make && make install
}

cd ${BUILD_DIR}

SDK="iphoneos"
ARCH_FLAGS="-arch arm64"
HOST_FLAGS="${ARCH_FLAGS} -miphoneos-version-min=8.0 -isysroot `xcrun -sdk ${SDK} --show-sdk-path`"
CHOST="arm-apple-darwin"
PREFIX=$BUILD_DIR
dobuild

