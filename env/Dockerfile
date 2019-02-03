FROM python:3.7-alpine

ADD . /src
WORKDIR /src
        
RUN pip install -r requirements.txt
CMD ["python", "src/apisf/app.py"]
