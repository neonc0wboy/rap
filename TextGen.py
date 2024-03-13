import langchain_community
from langchain_community.llms import KoboldApiLLM

def get_input(prompt):
    """Gets input from user with a prompt."""
    return input(prompt)

def main():
    # Get input from user
    endpoint = get_input("Enter the endpoint (without 'api' suffix): ")
    endpoint += "api"
    max_length = 666
    llm = KoboldApiLLM(endpoint=endpoint, max_length=max_length)
    question = get_input("Enter your question: ")

    # Get response from the LLM
    response = llm(question)
    print(response)

if __name__ == "__main__":
    main()
