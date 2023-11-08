

## Running Locally

<details>
  <summary>Setup Openchat Model Server vLLM (click to expand)</summary>

```bash
## create environment
conda create -y --name openchat
conda activate openchat
conda install -y python=3.11
pip3 install torch torchvision torchaudio
pip3 install ochat

## run openchat server 
python -m ochat.serving.openai_api_server --model openchat/openchat_3.5 --engine-use-ray --worker-use-ray

```
</details>


<details>
  <summary>Setup Llama_cpp_python GGUF Model Server (click to expand)</summary>

```bash
## create environment
virtualenv venv --python=3.10

pip3 install torch torchvision torchaudio

## install llama-cpp-python (for your environment)
(for example in linux with cuda support )
### Install Server with OpenAI Compatible API - with CUDA GPU support
CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python[server]

CMAKE_ARGS="-DLLAMA_CUBLAS=on -DBUILD_SHARED_LIBS=ON" FORCE_CMAKE=1 pip install llama-cpp-python[server] --force-reinstall --upgrade --no-cache-dir

```
# Run the Server using 5-bit quantized model

## run server with Zephyr-7B
export MODEL_FILE="./models/zephyr-7b-beta.Q5_K_M.gguf"
export MODEL_ID="TheBloke/zephyr-7B-beta.Q5_K_M.gguf"

python3 -m llama_cpp.server --n_gpu_layers 36 \
--model $MODEL_FILE \
--model_alias $MODEL_ID \
--chat_format "chatml"

## run server with openchat-3.5
export MODEL_FILE="./models/openchat_3.5.Q5_K_M.gguf"
export MODEL_ID="TheBloke/openchat_3.5.Q5_K_M.gguf"

python3 -m llama_cpp.server --n_gpu_layers 36 \
--model $MODEL_FILE \
--model_alias $MODEL_ID \
--chat_format "vicuna"

Note: 
- adjust --n_gpu_layers=36 means offload entire model to GPU
- this number should be adjusted according to available the GPU vram 
- start with smaller number like 6, default is 0 mean run in CPU only.

</details>

