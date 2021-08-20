
rm ./wrap/*.*
echo "All files cleared in wrap folder."


cp ./src/*.* ./wrap
rm ./wrap/main.cpp
echo "All files copied from ./src to ./wrap (except main.cpp)."

cp ./wrap.cpp ./wrap/
echo "Copied wrap.cpp to wrap/"