set(SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_glfw.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_vulkan.cpp

        ${CMAKE_CURRENT_SOURCE_DIR}/imgui.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_draw.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_demo.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_tables.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_widgets.cpp
)

set(HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_glfw.h
        ${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_vulkan.h

        ${CMAKE_CURRENT_SOURCE_DIR}/imgui.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imconfig.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_internal.h
)

add_library(imgui INTERFACE ${SOURCES} ${HEADERS})
target_link_libraries(imgui INTERFACE glfw)
target_include_directories(imgui INTERFACE ${Vulkan_INCLUDE_DIRS})
target_include_directories(imgui INTERFACE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/backends)
