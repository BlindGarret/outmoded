set(
    SOURCES 
        "src/main.cxx"
)

add_executable(outmoded ${SOURCES})

target_include_directories(outmoded PUBLIC "include")

# YAML
find_package (Yaml)
if (YAML_FOUND)
  include_directories(${YAML_INCLUDE_DIRS})
  target_link_libraries (outmoded ${YAML_LIBRARIES})
endif (YAML_FOUND)

# V8
find_package(V8)
if (V8_FOUND)
  include_directories(${V8_INCLUDE_DIRS})
  target_link_libraries (outmoded ${V8_LIBRARIES})
endif (V8_FOUND)
