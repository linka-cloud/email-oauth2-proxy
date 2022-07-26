FROM python:alpine


WORKDIR /email-oauth2-proxy
COPY . .
RUN python -m pip install -r requirements.txt


# See https://github.com/simonrob/email-oauth2-proxy/issues/11#issuecomment-1073855809
ENV PYSTRAY_BACKEND=dummy

ENTRYPOINT ["python", "/email-oauth2-proxy/emailproxy.py", "--no-gui", "--local-server-auth"]

