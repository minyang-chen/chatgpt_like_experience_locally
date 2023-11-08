
import subprocess

## auto launch two terminal process

subprocess.call(['gnome-terminal', '-x', 'bash', './run_mistral_gguf_server.sh'])
subprocess.call(['gnome-terminal', '-x', 'bash', './run_chatbot_web-ui.sh'])

