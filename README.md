# outmoded
Project Outmoded

# Prerequisites 
Yaml-cpp 0.6.x
V8 7.9.317


# V8 Compilation notes

python tools/dev/v8gen.py x64.release

nano out.gn/x64.release/args.gn

is_debug = false
target_cpu = "x64"
is_component_build = false
target_os = "linux"
is_clang = false
use_custom_libcxx = false
enable_nacl = false
enable_nacl_nonsfi = false
exclude_unwind_tables = true
icu_use_data_file = false
msan_track_origins = 0
symbol_level = 0
use_udev = false
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_static_library = true

ninja -C out.gn/x64.release