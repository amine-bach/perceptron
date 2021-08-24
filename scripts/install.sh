# - Create the perceptron_venv virtualenv in /workspace/gitpod
# - If argument -c is given :
#       - compilation -> lib 'perceptron.cpython-38-x86_64-linux-gnu.so' is created
#       - the lib is copied to be used by perceptron_venv
# - test_perceptron.py executed using perceptron_venv

gitpod_workspace=/workspace/gitpod_1
perceptron_venv=${gitpod_workspace}/perceptron_venv

echo "----------"
# Create virtual_env if necessary
if [ ! -d ${perceptron_venv} ];then
    python3 -m venv perceptron_venv --system-site-package
    echo "perceptron_venv in ${venvs_path} created in $(pwd)."

    source ${perceptron_venv}/bin/activate
    python -m pip install -r ${gitpod_workspace}/scripts/requirements.txt
    echo "python packages installed."    
else
    echo "Your venv ${perceptron_venv} already exists."
fi
echo "----------"

# Compile and create python lib in perceptron_venv
if [[ $1 = "-c" ]]
then
    # Compilation C++ from scratch
    if [ -d "release" ];then
        rm -r release    
        echo "Clear release"
    else
        echo "Create release"
    fi

    mkdir release && cd release
    cmake .. && make 

    # Update virtual_env
    version_python=(`ls ${perceptron_venv}/lib`)   
    echo "version_python=$version_python"    
    perceptron_package=${perceptron_venv}/lib/$version_python/site-packages/
        
    cp *.so ${perceptron_package}
    echo ".so copied in ${perceptron_package}"

    cd ..
else
    echo "Module from Cpp left inchanged."
fi
echo

echo "----------"
source ${perceptron_venv}/bin/activate
python test_perceptron.py