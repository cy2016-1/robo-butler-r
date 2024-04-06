cmake_minimum_required(VERSION 2.6)
SET(PROJECT_NAME control_task2)
PROJECT(${PROJECT_NAME})
find_package(Eigen3)
add_compile_definitions(__USE_SINGLE_PRECISION__)

INCLUDE_DIRECTORIES(${EIGEN3_INCLUDE_DIR})
set( CMAKE_BUILD_TYPE "Release" )
set( CMAKE_CXX_FLAGS "-std=c++11 -O3 -pthread" )
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/../build)

include_directories( 
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/include_vmc"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/include_wb"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/vmc_inc"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/mpc"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/vision_location"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/math_src"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/cube_vision"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/share_mem"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/qpOASES/include"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/urdf"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/rbdl"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/model"
    "/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/common_utils"
)

link_directories("/usr/local/lib")
include_directories("/usr/local/include")
link_directories("/home/tinymal/下载/cross-gcc-odroid/aarch64-linux-gnu/lib")
include_directories("/home/tinymal/下载/cross-gcc-odroid/aarch64-linux-gnu/include")

AUX_SOURCE_DIRECTORY(./src DIR_SRCS5)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/gait_src DIR_SRCS)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/locomotion_src DIR_SRCS1)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/math_src DIR_SRCS2)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/mpc DIR_SRCS3)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/share_mem DIR_SRCS4)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/urdf  DIR_SRCS6)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/rbdl  DIR_SRCS7)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/model DIR_SRCS8)
AUX_SOURCE_DIRECTORY(/home/tinymal/文档/tinystrech/controllers/tinyscretch/rbdl_src/common_utils DIR_SRCS9)

ADD_EXECUTABLE(${PROJECT_NAME} ${DIR_SRCS} ${DIR_SRCS1}  ${DIR_SRCS2} ${DIR_SRCS3} ${DIR_SRCS4} ${DIR_SRCS5}
    ${DIR_SRCS6} ${DIR_SRCS7} ${DIR_SRCS8} ${DIR_SRCS9}
    )

add_subdirectory(/home/tinymal/文档/tinystrech/controllers/tinyscretch/qpOASES lib_qp/ EXCLUDE_FROM_ALL)
target_link_libraries(${PROJECT_NAME} qpOASES)

add_subdirectory(/home/tinymal/文档/tinystrech/controllers/tinyscretch/yaml-cpp lib_yaml/ EXCLUDE_FROM_ALL)
target_link_libraries(${PROJECT_NAME} yaml-cpp)

set(CMAKE_COLOR_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 14)

# 将选项的值传递给C++源代码中的宏
add_definitions(-DRUN_WEBOTS=0)
