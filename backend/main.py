from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
from fastapi.middleware.cors import CORSMiddleware

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

# Endpoint to drop tables
@app.post("/drop-tables")
def drop_tables():
    # Logic to drop tables
    return {"message": "Tables dropped successfully."}

# Endpoint to create tables
@app.post("/create-tables")
def create_tables():
    # Logic to create tables
    return {"message": "Tables created successfully."}

# Endpoint to populate tables
@app.post("/populate-tables")
def populate_tables():
    # Logic to populate tables
    return {"message": "Tables populated successfully."}

# Endpoint to query tables
@app.get("/query-tables")
def query_tables():
    # Logic to query tables
    return {"message": "Table query results go here."}

    
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)