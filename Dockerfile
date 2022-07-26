FROM python:alpine


WORKDIR /email-oauth2-proxy

COPY requirements.txt requirements.txt
COPY emailproxy.config emailproxy.config
COPY emailproxy.py emailproxy.py
COPY LICENSE LICENSE
COPY README.md README.md

RUN python -m pip install -r requirements.txt


# See https://github.com/simonrob/email-oauth2-proxy/issues/11#issuecomment-1073855809
ENV PYSTRAY_BACKEND=dummy

ENTRYPOINT ["python", "/email-oauth2-proxy/emailproxy.py", "--no-gui", "--local-server-auth"]

