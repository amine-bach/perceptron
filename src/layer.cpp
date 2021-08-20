#include "layer.h"
#include <iostream>

Layer::Layer(int nb_neurons, int nb_in, std::string activation/*="tanh"*/):
    nb_neurons(nb_neurons), nb_in(nb_in), activation(activation)
{
    std::cout << "activation = " << activation ;
 }

Eigen::MatrixXd Layer::activate(const Eigen::MatrixXd &_Z)
{
    std::cout << "ERROR : this activation does not exists yet !!" << std::endl;
    return _Z;
}