#include <iostream>
#include <Eigen/Dense>

int main()
{
    Eigen::Matrix3f  m1;   
    m1 << 1, 2, 3,
          4, 5, 6,
          7, 8, 9;
    std::cout << m1 << std::endl;

    std::cout << "Eigen Ok" << std::endl;
    return 0;
}