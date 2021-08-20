cmake_minimum_required(VERSION 3.5)

project(perceptron_cpp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package (Eigen3 3.3 REQUIRED NO_MODULE)

add_executable(perceptron main.cpp


)

target_link_libraries (perceptron Eigen3::Eigen)