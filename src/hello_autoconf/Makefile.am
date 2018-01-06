nobase_include_HEADERS=demo/rw_lock_demo.h utils/swap.h
AM_CPPFLAGS=-I$(srcdir)

nobase_lib_LTLIBRARIES=demo/librwlockdemo.la utils/libutils.la

demo_librwlockdemo_la_SOURCES=demo/rw_lock_demo.cc demo/rw_lock_demo.h
utils_libutils_la_SOURCES=utils/swap.cc utils/swap.h

#install-exec-hook:
#	test -d @libdir@/demo/@host@ || mkdir @libdir@/demo/@host@ ; \
#	mv @libdir@/demo/librwlockdemo.a @libdir@/demo/@host@ ; \
#	test -d @libdir@/utils/@host@ || mkdir @libdir@/utils/@host@ ; \
#	mv @libdir@/utils/libutils.a @libdir@/utils/@host@
