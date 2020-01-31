#--------------------------------------------------
#   YAML: YAML parser/emitter for cpp
#--------------------------------------------------

# Variables
# YAML_FOUND        - System has YAML
# YAML_INCLUDE_DIRS - Includes for YAML
# YAML_LIBRARIES    - Libraries for YAML
# YAML_LFLAGS       - Linker flags

include(FindPackageHandleStandardArgs)

# Find Headers
find_path (
    YAML_INCLUDE_DIR yaml-cpp/yaml.h yaml-cpp/node.h 
    HINTS ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES include
)

# Find Libraries
find_library(
    YAML_LIBRARY yaml-cpp
    HINTS ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
)

find_package_handle_standard_args(
  YAML  DEFAULT_MSG
  YAML_LIBRARY YAML_INCLUDE_DIR
)

mark_as_advanced(
  YAML_LIBRARY YAML_INCLUDE_DIR
)

set(YAML_LIBRARIES ${YAML_LIBRARY})
set(YAML_INCLUDE_DIRS ${YAML_INCLUDE_DIR})

IF(YAML_LIBRARIES AND YAML_INCLUDE_DIRS)
  SET(YAML_FOUND true)
ENDIF(YAML_LIBRARIES AND YAML_INCLUDE_DIRS)