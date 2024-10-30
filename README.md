## Setting up the project using docker

```shell
cd CPS510-Database
docker-compose up
```

Then visit http://localhost:8000

(Note: docker needed on the computer)



## OR



## Setting up the backend manually

```shell
cd backend
python3 -m venv .env
source .env/bin/activate
pip3 install -r requirements.txt
python3 main.py
```

Then visit http://localhost:8000

## Setting up the frontend manually

```shell
cd frontend
yarn install
yarn run dev
```

Then visit http://localhost:5173
