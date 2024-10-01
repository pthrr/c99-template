set(CMAKE_VERBOSE_MAKEFILE OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_program(CCACHE_PROGRAM sccache)

if(CCACHE_PROGRAM)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
  message(STATUS "Using sccache")
endif()

find_program(MOLD_LINKER mold)
find_program(GOLD_LINKER gold)

if(MOLD_LINKER)
  add_link_options("-fuse-ld=mold")
  message(STATUS "Using mold as linker")
elseif(GOLD_LINKER)
  add_link_options("-fuse-ld=gold")
  message(STATUS "Using gold as linker")
else()
  message(STATUS "Default linker will be used")
endif()

add_compile_options(
  -Wall
  -Wextra
  -pedantic
  -Wshadow
  -Wconversion
  -Wsign-conversion
  -Wimplicit-fallthrough
  -Wstrict-prototypes
)
add_compile_options(-fPIE)
add_link_options(-pie)

message(STATUS "Compiler ID is: ${CMAKE_C_COMPILER_ID}")
message(STATUS "Build type is: ${CMAKE_BUILD_TYPE}")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  add_compile_options(-Og -g3 -fsanitize=address,undefined)
  add_link_options(-fsanitize=address,undefined)
  add_compile_options(-fno-omit-frame-pointer)
else()
  add_compile_options(-O3 -DNDEBUG)
  add_link_options(-s)
  add_link_options(-static)
endif()
