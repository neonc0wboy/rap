import langchain_community
from langchain_community.llms import KoboldApiLLM
endpoint1=""
print("Paste the link: ")
endpoint1=input()
endpoint1=endpoint1+"api"
print(endpoint1)
llm = langchain_community.llms.koboldai.KoboldApiLLM(endpoint=endpoint1, max_length=666)
quest=""
quest=input()
response = llm(quest) 
print(response)
