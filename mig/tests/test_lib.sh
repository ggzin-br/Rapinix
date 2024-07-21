#!/bin/sh
#
# Copyright (C) 2016 Free Software Foundation, Inc.
#
# This file is part of GNU MIG.
#
# GNU MIG is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2, or (at
# your option) any later version.
#
# GNU MIG is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU MIG.  If not, see <http://www.gnu.org/licenses/>.
#

MIGCOM="$BUILDDIR/migcom"
TEST_DIR="$SRCDIR/tests"
CFLAGS="-I$TEST_DIR/includes"

failure () {
  msg="$1"
  echo "ERROR: $msg"
  return 0
}

run_mig () {
  file="$1"
  module="$2"
  echo "Generating stubs for $module..."
  cpp $file -I$TEST_DIR | $MIGCOM -server $module-server.c -user $module-user.c -header $module-header.h
}

test_module () {
  module="$1"
  echo "Compiling stubs for $module..."
  $CC $CFLAGS -c $module-server.c -o $module-server.o &&
  $CC $CFLAGS -c $module-user.c -o $module-user.o
}
