file(GLOB processing_SOURCES CONFIGURE_DEPENDS *.c)
file(GLOB processing_HEADER CONFIGURE_DEPENDS *.h)

add_library(processing STATIC ${processing_SOURCES} ${processing_HEADER})
target_include_directories(processing PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
