# rebuild all
rm -rf release

mkdir release && cd release
cmake .. && make

# and execute the program 
./perceptron