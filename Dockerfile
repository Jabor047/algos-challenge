FROM python:3.6.12

RUN apt-get update -y

# RUN /usr/local/bin/python -m pip install --upgrade pip

COPY requirements.txt /
RUN pip install -r /requirements.txt

# SET working dir to /app
WORKDIR /app
ADD . /app

# Copy local files into the workdir
COPY app.py /app/
COPY notebooks /app/notebooks
COPY data /app/data
COPY lib /app/lib

RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8

EXPOSE 80

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["exec python app.py"]