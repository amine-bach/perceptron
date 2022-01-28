#ifndef LAYER_H
#define LAYER_H
#include <functional>
#include <Eigen/Dense>

class Layer
{
public:
    Layer(int nb_neurons, int nb_in, const std::string activation="tanh");
    int nb_neurons, nb_in;
    Eigen::MatrixXd W; Eigen::MatrixXd Z;
    Eigen::VectorXd b;
    Eigen::MatrixXd A;

    Eigen::MatrixXd activate(const Eigen::MatrixXd &Z);

    std::string activation;
    std::function<double(double)> f_activation;
    std::function<double(double)> f_derivActivation;
};

#endif // LAYER_H