file(READ "${CMAKE_CURRENT_SOURCE_DIR}/src/main.c" PROJECT_VERSION_FILE)

string(REGEX MATCH "Program version: ([0-9]+\.[0-9]+\.[0-9]+)" _ ${PROJECT_VERSION_FILE})
set(PROJECT_VERSION ${CMAKE_MATCH_1})

message(STATUS "Project version is: ${PROJECT_VERSION}")
