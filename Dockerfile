FROM python:latest



RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x > node.sh
RUN chmod +x node.sh && ./node.sh
RUN apt-get install -y nodejs
RUN pip install lmql

CMD ["lmql", "playground"]
