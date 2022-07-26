FROM python:alpine


WORKDIR /email-oauth2-proxy
COPY . .
RUN python -m pip install -r requirements.txt


# See https://github.com/simonrob/email-oauth2-proxy/issues/11#issuecomment-1073855809
ENV PYSTRAY_BACKEND=dummy

# 1993 for IMAP, localhost on port 1995 for POP and localhost on port 1587 for SMTP
EXPOSE 1993 1995 1587

ENTRYPOINT ["python", "/email-oauth2-proxy/emailproxy.py", "--no-gui"]

CMD ["--local-server-auth"]
