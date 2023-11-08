
#!/bin/bash
# Download Models from HuggingFace
cd models

# Mistral 7B GGUF Q-5bit model Q5_K_M
wget https://huggingface.co/TheBloke/Mistral-7B-Claude-Chat-GGUF/resolve/main/mistral-7b-claude-chat.Q5_K_M.gguf

# Openchat 3.5
wget https://huggingface.co/TheBloke/openchat_3.5-GGUF/resolve/main/openchat_3.5.Q5_K_M.gguf

# TheBloke/zephyr-7B-beta-GGUF
wget https://huggingface.co/TheBloke/zephyr-7B-beta-GGUF/resolve/main/zephyr-7b-beta.Q5_K_M.gguf

cd ..

