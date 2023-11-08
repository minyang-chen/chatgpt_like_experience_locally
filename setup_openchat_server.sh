#!/bin/bash

# create conda environment
conda create -n openchat python=3.11
conda activate openchat

# install 
pip3 install torch torchvision torchaudio
pip3 install ochat
pip3 install openai

