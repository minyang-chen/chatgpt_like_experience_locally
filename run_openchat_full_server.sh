
#!/bin/bash
## required GPU with 24 GB VRAM -- fast inference
echo "run openchat server"
python -m ochat.serving.openai_api_server --model openchat/openchat_3.5 --engine-use-ray --worker-use-ray



