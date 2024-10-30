from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Item(BaseModel):
    name: str
    description: str = None
    price: float
    tax: float = None

@app.get("/")
def read_root():
    return {"message": "Welcome to the API"}

@app.post("/items/")
def create_item(item: Item):
    return {"item": item}
    
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)