#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <pybind11/eigen.h>

#include "layer.h"

namespace py = pybind11;
using namespace pybind11::literals;

PYBIND11_MODULE(perceptron, m)
{
    py::class_<Layer>(m, "Layer")
        .def(py::init<int, int, const std::string &>(), "nb_neurons"_a, "nb_in"_a, "activation"_a = "tanh")
        .def("activate", &Layer::activate);
}