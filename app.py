from fastapi import FastAPI
from langchain_openai import ChatOpenAI
from langchain.prompts import ChatPromptTemplate
from langserve import add_routes
import uvicorn
import os
from dotenv import load_dotenv
load_dotenv()

os.environ["OPENAI_API_KEY"]=os.getenv("OPENAI_API_KEY")

app=FastAPI(
    title="Langchain Server",
    version="1.0",
    description="API Server Trial"
)

add_routes(
    app,
    ChatOpenAI(),
    path="/openai"
)
llm=ChatOpenAI()
prompt=ChatPromptTemplate.from_template("Write me a blog on {topic}")
add_routes(
    app,
    prompt|llm,
    path="/essay"
)
if __name__=="__main__":
    uvicorn.run(app,host="localhost",port=8000)