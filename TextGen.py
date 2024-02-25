import langchain_community
from langchain_community.llms import KoboldApiLLM

llm = langchain_community.llms.koboldai.KoboldApiLLM(endpoint="https://imagine-saddam-hero-clinic.trycloudflare.com/api", max_length=666)
quest=""
quest=input()
response = llm(quest) 
print(response)
