#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([hello-world-autoconf], [1.0.0], [wansong@sina.cn])
AC_CONFIG_SRCDIR([src/include/swap.h])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE(test,1.0)

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_RANLIB

# Checks for libraries.
AC_CHECK_LIB([pthread], [pthread_rwlock_init])

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
  src/lib/Makefile
  src/ModuleA/apple/shell/Makefile
  src/ModuleA/apple/core/Makefile])

AC_OUTPUT
