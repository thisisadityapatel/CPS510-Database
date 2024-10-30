FROM python:3.8
RUN mkdir /code
WORKDIR /code
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY ./main.py .
CMD ["python3", "main.py"]