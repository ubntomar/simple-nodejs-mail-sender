FROM node:latest
COPY ./mailer /root
RUN apt update
RUN apt install -y libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev
RUN apt install -y libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm-dev libnss3-dev libxss-dev
RUN apt install -y libasound2
RUN npm install -g npm@9.5.1 
WORKDIR /root
RUN echo "" > ./package-lock.json && rm ./package-lock.json
RUN npm install
RUN npm install pm2 -g
RUN ls -la /root 
CMD ["pm2-runtime", "index.js"]
#RUN npm install --production
#CMD [ "pm2-runtime", "start", "pm2.json" ]

