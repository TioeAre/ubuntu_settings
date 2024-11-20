cmake_minimum_required(VERSION 3.20)

project()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories()

file(GLOB_RECURSE srcs src/**/*.cpp)

# find_package(OpenCV REQUIRED)
# include_directories(${OpenCV_INCLUDE_DIRS})
# link_directories(${OpenCV_LIBRARY_DIRS})
# find_package(Eigen REQUIRED)
# include_directories(${Eigen_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} ${srcs})

target_link_libraries(${PROJECT_NAME} )
