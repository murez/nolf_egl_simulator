cmake_minimum_required(VERSION 3.16)
project(NOLF_SIM LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(glm)
link_directories(${PROJECT_SOURCE_DIR}/simlib)
list(APPEND LIBRARIES  ${CMAKE_DL_LIBS})
list(APPEND LIBRARIES libsimulator.a)
list(APPEND LIBRARIES EGL GL)
list(APPEND LIBRARIES glm::glm)


file(GLOB SRC_FILES src/*.cpp )

add_executable(main ${SRC_FILES} ${INTERNAL_SRC_FILES})

target_include_directories(main PRIVATE include)
target_compile_features(main PRIVATE cxx_std_17)
target_compile_definitions(main PRIVATE ${DEFINES})
target_link_libraries(main PRIVATE ${LIBRARIES})
