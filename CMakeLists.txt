cmake_minimum_required(VERSION 3.27 FATAL_ERROR)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(
  my_project
  LANGUAGES C
  VERSION 0.1.0
  DESCRIPTION "My project")

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/ProjectSettings.cmake)

find_package(unity REQUIRED)

add_subdirectory(external)
add_subdirectory(src)
add_subdirectory(tests)

execute_process(
    COMMAND ${CMAKE_COMMAND} -E create_symlink
    ${CMAKE_BINARY_DIR}/compile_commands.json
    ${CMAKE_SOURCE_DIR}/build/compile_commands.json
)
