#--------------------------------------------------
#   V8: Embedded Javascript Runtime
#--------------------------------------------------

# Variables
# V8_FOUND        - System has V8
# V8_INCLUDE_DIRS - Includes for V8
# V8_LIBRARIES    - Libraries for V8
# V8_LFLAGS       - Linker flags for V8

include(FindPackageHandleStandardArgs)

# IF (NOT $ENV{V8_DIR} STREQUAL "")
#   SET(V8_DIR $ENV{V8_DIR})
# ENDIF()

# Search Paths
SET(V8_LIBRARY_SEARCH_PATHS
  ${V8_DIR}/
  ${V8_DIR}/lib/
  ${V8_DIR}/build/Release/lib/
  ${V8_DIR}/build/Release/lib/third_party/icu/
  ${V8_DIR}/build/Release/obj/
  ${V8_DIR}/build/Release/obj/third_party/icu/
  ${V8_DIR}/out/ia32.release/lib.target/
  ${V8_DIR}/out/ia32.release/lib.target/third_party/icu/
  ${V8_DIR}/out/ia32.release/obj/
  ${V8_DIR}/out/ia32.release/obj/third_party/icu/
  ${V8_DIR}/out.gn/ia32.release/lib.target/
  ${V8_DIR}/out.gn/ia32.release/lib.target/third_party/icu/
  ${V8_DIR}/out.gn/ia32.release/obj/
  ${V8_DIR}/out.gn/ia32.release/obj/third_party/icu/
  ${V8_DIR}/out/x64.release/lib.target/
  ${V8_DIR}/out/x64.release/lib.target/third_party/icu/
  ${V8_DIR}/out/x64.release/obj/
  ${V8_DIR}/out/x64.release/obj/third_party/icu/
  ${V8_DIR}/out.gn/x64.release/lib.target/
  ${V8_DIR}/out.gn/x64.release/lib.target/third_party/icu/
  ${V8_DIR}/out.gn/x64.release/obj/
  ${V8_DIR}/out.gn/x64.release/obj/third_party/icu/
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/lib
  /usr/lib
  /sw/lib
  /opt/local/lib
  /opt/csw/lib
  /opt/lib
  /usr/freeware/lib64
)

# Find Headers
FIND_PATH(V8_INCLUDE_DIR v8.h
  ${V8_DIR}
  ${V8_DIR}/include
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/include
  /usr/include
  /sw/include
  /opt/local/include
  /opt/csw/include
  /opt/include
  /usr/freeware/include
  /devel
)

# Find Libraries
# find_library(
#     V8_LIBRARY 
#     NAMES libv8_libbase.a v8_libbase.a v8 v8_libbase libv8_libbase
#     HINTS ${CMAKE_INSTALL_PREFIX}
#     PATH_SUFFIXES lib
# )

# FIND_LIBRARY(
#     V8_LIBPLATFORM_LIBRARY
#     NAMES v8_libplatform libv8_libplatform
#     PATHS ${V8_LIBRARY_SEARCH_PATHS}
# )

FIND_LIBRARY(
    V8_MONOLITH_LIBRARY
    NAMES libv8_monolith v8_monolith libv8_monolith.a v8_monolith.a
    PATHS ${V8_LIBRARY_SEARCH_PATHS}
)

find_package_handle_standard_args(
  V8  DEFAULT_MSG
  V8_INCLUDE_DIR V8_MONOLITH_LIBRARY
)

mark_as_advanced(
    V8_INCLUDE_DIR V8_MONOLITH_LIBRARY
)

IF(UNIX)
  SET(V8_LIBRARIES ${V8_MONOLITH_LIBRARY} "pthread")
ELSE(WIN32)
  SET(V8_LIBRARIES ${V8_MONOLITH_LIBRARY})
ENDIF(UNIX)

set(V8_INCLUDE_DIRS ${V8_INCLUDE_DIR})

IF(V8_LIBRARIES AND V8_INCLUDE_DIRS)
  SET(V8_FOUND true)
ENDIF(V8_LIBRARIES AND V8_INCLUDE_DIRS)