#--------------------------------------------------
#   V8: Embedded Javascript Runtime
#--------------------------------------------------

# Variables
# V8_FOUND        - System has V8
# V8_INCLUDE_DIRS - Includes for V8
# V8_LIBRARIES    - Libraries for V8
# V8_LFLAGS       - Linker flags for V8

include(FindPackageHandleStandardArgs)

IF (NOT $ENV{V8_DIR} STREQUAL "")
  SET(V8_DIR $ENV{V8_DIR})
ENDIF()

# Search Paths
SET(V8_LIBBASE_SEARCH_PATHS
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
)

# Find Headers
FIND_PATH(V8_INCLUDE_DIR v8.h
  ${V8_DIR}/
  ${V8_DIR}/include
)

# Find Libraries
find_library(
  V8_BASE_WITHOUT_COMPILER
  NAMES v8_base_without_compiler 
  HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
  PATH_SUFFIXES lib
)
if(NOT V8_BASE_WITHOUT_COMPILER)
  message( FATAL_ERROR "Cannot find libary V8_BASE_WITHOUT_COMPILER" )
else()
  message( "-- Found V8_BASE_WITHOUT_COMPILER: ${V8_BASE_WITHOUT_COMPILER}" )
endif(NOT V8_BASE_WITHOUT_COMPILER)

find_library(
    V8_LIBBASE 
    NAMES v8_libbase
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_LIBBASE)
  message( FATAL_ERROR "Cannot find libary V8_LIBBASE" )
else()
  message( "-- Found V8_LIBBASE: ${V8_LIBBASE}" )
endif(NOT V8_LIBBASE)

find_library(
    V8_SNAPSHOT
    NAMES v8_snapshot
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_SNAPSHOT)
  message( FATAL_ERROR "Cannot find libary V8_SNAPSHOT" )
else()
  message( "-- Found V8_SNAPSHOT: ${V8_SNAPSHOT}" )
endif(NOT V8_SNAPSHOT)

find_library(
    V8_LIBPLATFORM_LIBRARY
    NAMES v8_libplatform
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_LIBPLATFORM_LIBRARY)
  message( FATAL_ERROR "Cannot find libary V8_LIBPLATFORM_LIBRARY" )
else()
  message( "-- Found V8_LIBPLATFORM_LIBRARY: ${V8_LIBPLATFORM_LIBRARY}" )
endif(NOT V8_LIBPLATFORM_LIBRARY)

find_library(
    V8_LIBSAMPLER
    NAMES v8_libsampler 
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_LIBSAMPLER)
  message( FATAL_ERROR "Cannot find libary V8_LIBSAMPLER" )
else()
  message( "-- Found V8_LIBSAMPLER: ${V8_LIBSAMPLER}" )
endif(NOT V8_LIBSAMPLER)

find_library(
    V8_COMPILER
    NAMES v8_compiler 
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_COMPILER)
  message( FATAL_ERROR "Cannot find libary V8_COMPILER" )
else()
  message( "-- Found V8_COMPILER: ${V8_COMPILER}" )
endif(NOT V8_COMPILER)

find_library(
    V8_WEE8
    NAMES wee8
    HINTS ${V8_LIBBASE_SEARCH_PATHS} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)
if(NOT V8_WEE8)
  message( FATAL_ERROR "Cannot find libary V8_WEE8" )
else()
  message( "-- Found V8_COMPILER_OPT: ${V8_WEE8}" )
endif(NOT V8_WEE8)

find_package_handle_standard_args(
  V8  DEFAULT_MSG
  V8_INCLUDE_DIR 
  V8_BASE_WITHOUT_COMPILER 
  V8_LIBBASE 
  V8_SNAPSHOT 
  V8_LIBPLATFORM_LIBRARY 
  V8_LIBSAMPLER 
  V8_ICUUC 
  V8_ICUI18N 
  V8_INSPECTOR
)

mark_as_advanced(  
  V8_INCLUDE_DIR 
  V8_WEE8
  V8_LIBPLATFORM_LIBRARY 
  V8_COMPILER
  V8_BASE_WITHOUT_COMPILER 
  V8_SNAPSHOT 
  V8_LIBSAMPLER 
  V8_LIBBASE 
)

IF(UNIX)
  SET(V8_LIBRARIES 
    -pthread
    ${V8_WEE8}
    ${V8_LIBPLATFORM_LIBRARY}
    ${V8_COMPILER}
    ${V8_BASE_WITHOUT_COMPILER}
    ${V8_SNAPSHOT}
    ${V8_LIBSAMPLER}
    ${V8_LIBBASE}
  )
ELSE(WIN32)
  SET(V8_LIBRARIES 
    ${V8_WEE8}
    ${V8_LIBPLATFORM_LIBRARY}
    ${V8_COMPILER}
    ${V8_BASE_WITHOUT_COMPILER}
    ${V8_SNAPSHOT}
    ${V8_LIBSAMPLER}
    ${V8_LIBBASE}
  )
ENDIF(UNIX)

set(V8_INCLUDE_DIRS ${V8_INCLUDE_DIR})

IF(V8_LIBRARIES AND V8_INCLUDE_DIRS)
  SET(V8_FOUND true)
ENDIF(V8_LIBRARIES AND V8_INCLUDE_DIRS)