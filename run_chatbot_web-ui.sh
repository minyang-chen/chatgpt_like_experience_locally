
#!/bin/bash
echo "GGUF Chatbot UI"

export NEXT_PUBLIC_DEFAULT_SYSTEM_PROMPT="You are ChatGPT, a large language model trained by OpenAI. Follow the user's instructions carefully. Respond using markdown"
export NEXT_PUBLIC_DEFAULT_TEMPERATURE=0.5
export DEFAULT_MODEL=gpt-3.5-turbo
export OPENAI_API_KEY=EMPTY
export OPENAI_API_TYPE=openai

## openchat vllm server
#export OPENAI_API_HOST=http://localhost:18888
## llama_cpp_python GGUF file server
export OPENAI_API_HOST=http://127.0.0.1:8000

cd gguf-chatbot-ui

npm install

npm run dev
