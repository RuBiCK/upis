FROM alpine

# basic flask environment
RUN apk add --no-cache bash py2-pip \
	&& pip2 install --upgrade pip 

# application folder
ENV APP_DIR /app

# app dir
RUN mkdir ${APP_DIR} 
	#&& chmod 777 /run/ -R \
	#&& chmod 777 /root/ -R
VOLUME ${APP_DIR}
WORKDIR ${APP_DIR}

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY ./app /app
CMD ["flask", "run"]