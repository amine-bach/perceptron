rm -rf release

mkdir release && cd release
cmake ..

make

./perceptron