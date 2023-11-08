
#!/bin/bash
echo "serving [openchat 3.5]"

export MODEL_FILE="./models/openchat_3.5.Q5_K_M.gguf"
export MODEL_ID="TheBloke/openchat_3.5.Q5_K_M.GGUF"
export OFFLOAD_GPU_LAYERS=35
export HOST=0.0.0.0
export PORT=8000
#export CHAT_FORMAT="llama-2"
export CHAT_FORMAT="vicuna"
export CONTEXT_SIZE=4096

## run server
python3 -m llama_cpp.server \
--n_gpu_layers $OFFLOAD_GPU_LAYERS \
--model $MODEL_FILE \
--model_alias $MODEL_ID \
--chat_format $CHAT_FORMAT \
--n_ctx $CONTEXT_SIZE \
--host $HOST \
--port $PORT \
--seed 123
