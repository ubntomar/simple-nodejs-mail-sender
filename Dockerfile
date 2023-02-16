FROM node:latest
COPY ./mailer /root
RUN apt update 
WORKDIR /root
RUN echo "" > ./package-lock.json && rm ./package-lock.json
RUN npm install
RUN npm install pm2 -g
RUN ls -la /root 
CMD ["pm2-runtime", "index.js"]
#RUN npm install --production
#CMD [ "pm2-runtime", "start", "pm2.json" ]

