check_PROGRAMS=test_rw_lock_demo

src_dir=$(top_srcdir)/src
hello_autoconf_srcdir=$(src_dir)/hello_autoconf

build_dir=$(top_builddir)/src
hello_autoconf_builddir=$(build_dir)/hello_autoconf

test_rw_lock_demo_SOURCES=test_rw_lock_demo.cc
test_rw_lock_demo_LDADD=$(hello_autoconf_builddir)/demo/librwlockdemo.la $(hello_autoconf_builddir)/utils/libutils.la
test_rw_lock_demo_CPPFLAGS=-I$(hello_autoconf_srcdir)
test_rw_lock_demo_LDFLAGS=-static

TESTS=$(check_PROGRAMS)
