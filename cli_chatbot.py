#!/usr/bin/python3
"""
Simple OpenAI CLI ChatBot Client

Python chat client for OpenAI and the llama-cpp-python[server] OpenAI API Compatible 
Web Server. Provides a simple command line interface (CLI) chat session.
"""
import openai
import datetime

# Configuration Settings - Showing local LLM
openai.api_key = "EMPTY_API_KEY"                
openai.api_base = "http://localhost:8000/v1"     
ainame = "chatgpt"                               
aimodel  ="models/model.gguf"        

# Set base prompt and initialize the context array for conversation dialogue
current_date = datetime.datetime.now()
formatted_date = current_date.strftime("%m/%d/%Y")
baseprompt = "You are %s, a highly intelligent assistant. Keep your answers brief and accurate. Current date is %s." % (ainame, formatted_date)
context = [{"role": "system", "content": baseprompt}]

# Function - Send prompt to LLM for response
def ask(prompt):
    global context
    # remember context
    context.append({"role": "user", "content": prompt})
    response = openai.ChatCompletion.create(
        model=aimodel,
        max_tokens=1024,
        stream=True, # Send response chunks as LLM computes next tokens
        temperature=0.7,
        messages=context,
    )
    return response

# Function - Render LLM response output in chunks
def printresponse(response):
    completion_text = ''
    # iterate through the stream of events and print it
    for event in response:
        event_text = event['choices'][0]['delta']
        if 'content' in event_text:
            chunk = event_text.content
            completion_text += chunk
            print(f"{chunk}",end="",flush=True) 
    print("",flush=True)
    # remember context
    context.append({"role": "assistant", "content" : completion_text})
    return completion_text

# Chatbot Header
print(f"ChatBot - Greetings! My name is {ainame}. Enter an empty line to quit chat.")
print()

prompts = []
# Loop to prompt user for input
while True:
    if len(prompts) > 0:
        p = prompts.pop(0)
        print(f"> {p}")
    else:
        p = input("> ")
    if not p or p == "":
        break
    print()
    response=ask(p)
    print(f"{ainame}> ",end="", flush=True)
    ans = printresponse(response)
    print()

print("Done")
