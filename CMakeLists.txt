cmake_minimum_required(VERSION 3.15)

# project perceptron_nn (compile for cpython binding)
project(perceptron_nn LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package (Eigen3 3.3 REQUIRED NO_MODULE)

add_subdirectory(pybind11)

pybind11_add_module(perceptron
    src/layer.h    
    src/layer.cpp    
          
    src/wrap.cpp
)

include_directories (perceptron_nn ${EIGEN3_INCLUDE_DIRS})