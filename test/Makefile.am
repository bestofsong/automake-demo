check_PROGRAMS=test_rw_lock_demo

src_dir=$(top_srcdir)/src
hello_autoconf_srcdir=$(src_dir)/hello_autoconf

build_dir=$(top_builddir)/src
hello_autoconf_builddir=$(build_dir)/hello_autoconf

utils_builddir=$(hello_autoconf_builddir)/utils
demo_builddir=$(hello_autoconf_builddir)/demo

test_rw_lock_demo_SOURCES=test_rw_lock_demo.cc
test_rw_lock_demo_LDFLAGS=-L$(utils_builddir) -L$(demo_builddir)
test_rw_lock_demo_CXXFLAGS=-lutils -lrwlockdemo
test_rw_lock_demo_CPPFLAGS=-I$(hello_autoconf_srcdir)

TESTS=$(check_PROGRAMS)