add_subdirectory(processing)

file(GLOB ${PROJECT_NAME}_SOURCES CONFIGURE_DEPENDS *.c)
file(GLOB ${PROJECT_NAME}_HEADER CONFIGURE_DEPENDS *.h)

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES} ${${PROJECT_NAME}_HEADER})
target_link_libraries(${PROJECT_NAME} PRIVATE processing)
