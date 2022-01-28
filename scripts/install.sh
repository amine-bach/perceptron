#!/bin/bash

# - Create the perceptron_venv virtualenv in /workspace/gitpod
# - If argument -c is given :
#       - compilation -> lib 'perceptron.cpython-38-x86_64-linux-gnu.so' is created
#       - the lib is copied to be used by perceptron_venv
# - test_perceptron.py executed using perceptron_venv

echo "install.sh : -- BEGIN -"

is_git_pod=0 # Si on est PAS sur gitPod mettre à 0 

if [ ! -d ${is_git_pod} ];then 
    # environnement local
    home_dir=~    
    perceptron_venv=${home_dir}/venvs/perceptron_venv    
else
    # environnement gitpod
    home_dir=/workspace/perceptron
    perceptron_venv=${home_dir}/venvs/perceptron_venv
fi

current_dir=$PWD
echo "install.sh : current dir is ${current_dir}"

echo "install.sh : ----------"
echo "install.sh : Install virtualvenv"

# Create virtual_env if necessary
if [ ! -d ${perceptron_venv} ];then
    python3 -m venv $perceptron_venv --system-site-package
    if [ $? -eq 0 ]; then
        echo "install.sh : perceptron_venv in ${perceptron_venv} created in $(pwd)."
    else
        echo "install.sh : Creation of perceptron_venv failed. Exit."
        exit 2
    fi
    source ${perceptron_venv}/bin/activate
    python -m pip install -r ${current_dir}/scripts/requirements.txt

    temp={$?}
    if [ ! -d ${temp} ];then
        echo "install.sh : python packages NOT installed. Exit"
        #exit 2
    else
        echo "install.sh : python packages now installed."    
    fi
else
    echo "Your venv ${perceptron_venv} already exists."
fi

echo "install.sh : ----------"
echo "install.sh : Compile and create lib for Python"

# Compile and create python lib in perceptron_venv
if [[ $1 = "-c" ]]
then
    # Compilation C++ from scratch
    if [ -d "${current_dir}/release" ];then
        rm -r ${current_dir}/release    
        echo "Clear ${current_dir}/release"
    else
        echo "Create ${current_dir}/release"
    fi

    mkdir ${current_dir}/release && cd ${current_dir}/release
    cmake .. && make 
    temp={$?}
    if [ ! -d ${temp} ];then
        echo "error in creating .so ${temp}"
    else
        echo "creation of perceptron.so OK"
    fi

    # Update virtual_env
    version_python=(`ls ${perceptron_venv}/lib`)   
    echo "install.sh : version_python=$version_python"    
    perceptron_package=${perceptron_venv}/lib/$version_python/site-packages/
        
    cp *.so ${perceptron_package}
    echo "install.sh : .so copied in ${perceptron_package}"

    cd ..
else
    echo "install.sh : Module from Cpp left inchanged."
fi
echo

echo "install.sh : ----------"
echo "install.sh : execute 'test_perceptron.py' =>"

${perceptron_venv}/bin/python ${current_dir}/test_perceptron.py

echo "install.sh : --- END --"