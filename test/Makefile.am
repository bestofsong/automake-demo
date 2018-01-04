check_PROGRAMS=test_rw_lock_demo

src_dir=$(top_srcdir)/src
hello_autoconf_srcdir=$(src_dir)/hello_autoconf

build_dir=$(top_builddir)/src
hello_autoconf_builddir=$(build_dir)/hello_autoconf

test_rw_lock_demo_SOURCES=test_rw_lock_demo.cc
test_rw_lock_demo_LDFLAGS=-L$(hello_autoconf_builddir)/demo -L$(hello_autoconf_builddir)/utils
test_rw_lock_demo_CXXFLAGS=-lutils -lrwlockdemo
test_rw_lock_demo_CPPFLAGS=-I$(hello_autoconf_srcdir)

TESTS=$(check_PROGRAMS)
