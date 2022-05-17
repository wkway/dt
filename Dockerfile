FROM python:3

WORKDIR /usr/src
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone --depth 1 https://github.com/StevenBlack/hosts.git
WORKDIR /usr/src/hosts
COPY blacklistfile ./
COPY data ./data/
RUN wget -N https://raw.githubusercontent.com/wkway/gh/master/hosts && iconv -f ASCII -t UTF-8  hosts -o myhosts
