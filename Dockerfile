<<<<<<< HEAD
FROM alpine:3.7
=======
FROM arm32v7/alpine:3.9.5
>>>>>>> 4cab276e3b2245a1de86aa798e6627e4a40d4a62

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
