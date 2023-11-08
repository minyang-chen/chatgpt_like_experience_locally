#!/bin/bash

# create environment
virtualenv venv --python=3.10
source venv/bin/activate

# Install Python Libraries with Nvidia GPU support
CMAKE_ARGS="-DLLAMA_CUBLAS=on -DBUILD_SHARED_LIBS=ON" FORCE_CMAKE=1 pip install llama-cpp-python --force-reinstall --upgrade --no-cache-dir
CMAKE_ARGS="-DLLAMA_CUBLAS=on -DBUILD_SHARED_LIBS=ON" FORCE_CMAKE=1 pip install llama-cpp-python[server] --force-reinstall --upgrade --no-cache-dir

pip3 install torch torchvision torchaudio
pip3 install openai
