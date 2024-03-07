FROM python:alpine

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt 

CMD ["python3", "helloworld.py"]
