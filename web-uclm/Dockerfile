FROM mycompany

RUN apt-get update && apt-get install -y python3-pip && apt-get install -y npm && apt-get install -y nodejs
RUN npm install -g express && npm install -g body-parser && npm install -g request && npm install -g https && \
	npm install -g ejs && npm install -g nodemon
COPY web/ /web
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80


ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
