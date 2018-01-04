#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([hello-autoconf], [1.0.0], [wansong@sina.cn])
AC_CONFIG_SRCDIR([src/hello_autoconf/utils/swap.cc])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([foreign subdir-objects -Wall -Werror])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR

# Checks for libraries.
AC_CHECK_LIB([pthread], [pthread_rwlock_init])

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
  src/Makefile
  src/hello_autoconf/demo/Makefile
  src/hello_autoconf/utils/Makefile
  src/hello_autoconf/Makefile])

AC_OUTPUT
