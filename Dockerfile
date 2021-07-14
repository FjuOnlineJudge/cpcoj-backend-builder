FROM python:3

# Create and set folder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# apt-get update and install
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y gcc g++ build-essential python3 python3-pip mariadb-server libmariadb-dev libcap-dev apt-utils gnupg

# Installing python package
RUN cd /tmp && curl -JLO https://raw.githubusercontent.com/FjuOnlineJudge/cpcoj-backend/master/requirement.txt && pip3 install -r requirement.txt

# Install isolate
RUN curl -JLO https://raw.githubusercontent.com/FjuOnlineJudge/cpcoj-backend/master/scripts/install_isolate.sh && sh ./install_isolate.sh

# Run flask
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
