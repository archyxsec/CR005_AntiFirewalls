FROM mycompany

RUN apt-get update && apt-get install -y python3-pip
COPY API/ /flask_restful_api
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80

RUN pip3 install -r flask_restful_api/requeriments.txt

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
