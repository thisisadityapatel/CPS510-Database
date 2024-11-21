from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
from fastapi.middleware.cors import CORSMiddleware
import paramiko

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class LoginRequest(BaseModel):
    username: str
    password: str

class CustomQueryRequest(BaseModel):
    custom_query: str

# Oracle Database Connection Details
oracle_user = "oracle12c.scs.ryerson.ca"
oracle_password = "db_password"
oracle_service_name = "orcl12c"
local_port = 1521

# SSH Details
ssh_hostname = "moon.cs.ryerson.ca"
ssh_username = "username"
ssh_password = "password"
remote_host = "oracle.db.server"
remote_port = 22
ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

# Function to set up SSH tunnel
def create_ssh_tunnel(username, password):
    ssh_username = username
    ssh_password = password
    try:
        ssh_client.connect(ssh_hostname, username=ssh_username, password=ssh_password)
        return "Connection Established"
    except Exception as e:
        error = ("SSH Tunnel Error: " + str(e) + "\n")
        return error

def close_ssh():
    ssh_client.close()
    return ("SSH Connection Closed.\n")
    
# Function to run custom queries
def run_custom_query(custom_query):
    try:
        command = f'cd cps510 && echo "{custom_query}" > custom_query.sql && bash custom_query.sh'
        stdout, stderr = ssh_client.exec_command(command)
        result = stdout.read().decode() + stderr.read().decode()
        return (result + "\n")
    except Exception as e:
        return ("SSH Error: " + str(e) + "\n")

# Function to run scripts via SSH
def run_script_via_ssh(script_name):
    try:
        command = f'cd cps510 && bash {script_name}'
        stdout, stderr = ssh_client.exec_command(command)
        result = stdout.read().decode() + stderr.read().decode()
        print(result)
        return result
    except Exception as e:
        error = ("SSH Error: " + str(e) + "\n")
        return error

@app.get("/")
def read_root():
    
    return {"message": "Hello, Welcome to the API"}

# Endpoint to login to the db via ssh
@app.post("/login")
def login(request: LoginRequest):
    username = request.username
    password = request.password
    x = create_ssh_tunnel(username, password)
    # Logic to query tables using username and password
    print(x)
    # Logic to drop tables
    return {"message": "Logged in successfully."}

@app.get("/logout")
def logout():
    x = close_ssh()
    return {"message": x}

# Endpoint to drop tables
@app.get("/drop-tables")
def drop_tables():
    # Logic to drop tables
    run_script_via_ssh("drop_tables.sh")

    return {"message": "Tables dropped successfully."}

# Endpoint to create tables
@app.get("/create-tables")
def create_tables():
    run_script_via_ssh("create_tables.sh")
    # Logic to create tables
    return {"message": "Tables created successfully."}

# Endpoint to populate tables
@app.get("/populate-tables")
def populate_tables():
    # Logic to populate tables
    run_script_via_ssh("populate_tables.sh")
    return {"message": "Tables populated successfully."}

# Endpoint to query tables
@app.get("/query-tables")
def query_tables():
    run_script_via_ssh("queries.sh")
    # Logic to query tables
    return {"message": "test"}

# Endpoint to run a custom query
@app.post("/custom-query")
def query_tables(request: CustomQueryRequest):
    custom_query = request.custom_query
    run_custom_query(custom_query)    
    # Logic to query tables
    return {"message": "test"}
    
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)