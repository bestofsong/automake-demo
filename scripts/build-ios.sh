#! /bin/sh

set -e

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

LIPO_DIR=${BUILD_DIR}/lipo
LIPO_INPUT_DIR=${BUILD_DIR}/lipo/input
LIPO_OUTPUT_DIR=${BUILD_DIR}/lipo/output

PREFIX=$BUILD_DIR
LIB_DIR=${PREFIX}/lib
INCLUDE_DIR=${PREFIX}/include

[ -d "${BUILD_DIR}" ] && rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"


do_build() {
  export CC="$(xcrun -find -sdk ${SDK} cc)"
  export CXX="$(xcrun -find -sdk ${SDK} cxx)"
  export CPP="$(xcrun -find -sdk ${SDK} cpp)"
  export CFLAGS="${HOST_FLAGS} ${OPT_FLAGS}"
  export CXXFLAGS="${HOST_FLAGS} ${OPT_FLAGS}"
  export LDFLAGS="${HOST_FLAGS}"

  ${CONFIGURE} --host=${CHOST} --prefix=${PREFIX} --enable-static --disable-shared
  make && make install
}

do_collect_lib() {
  for mod in `ls "${LIB_DIR}"` ; do
    lipo_mod_dir=${LIPO_INPUT_DIR}/${mod}
    [ -d "${lipo_mod_dir}" ] || mkdir -p "${lipo_mod_dir}"
    lipo_mod_arch_dir=${lipo_mod_dir}/${ARCH}
    mv "${LIB_DIR}/${mod}" "${lipo_mod_arch_dir}"
  done
}

do_lipo() {
  echo ""
}

calc_cross_compile_flags() {
  echo "-arch ${ARCH} -miphoneos-version-min=8.0 -isysroot `xcrun -sdk ${SDK} --show-sdk-path`"
}


SDK_ARCH_HOSTS0=(iphoneos armv7 arm-apple-darwin)
SDK_ARCH_HOSTS1=(iphoneos armv7s arm-apple-darwin)
SDK_ARCH_HOSTS2=(iphoneos arm64 arm-apple-darwin)
SDK_ARCH_HOSTS3=(iphonesimulator i386 i386-apple-darwin)
SDK_ARCH_HOSTS4=(iphonesimulator x86_64 x86_64-apple-darwin)

cd ${BUILD_DIR}

for ii in 0 1 2 3 4 ; do
  eval SDK=\${SDK_ARCH_HOSTS${ii}[0]}
  eval ARCH=\${SDK_ARCH_HOSTS${ii}[1]}
  eval CHOST=\${SDK_ARCH_HOSTS${ii}[2]}
  HOST_FLAGS=`calc_cross_compile_flags`
  do_build
  do_collect_lib
done

