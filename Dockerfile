FROM alpine:3.16.0
ENV WORKDIR /usr/src/app/
WORKDIR $WORKDIR
COPY package*.json $WORKDIR
RUN npm install --production --no-cache

FROM node:12.16.0-alpine3.11
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR
ADD --from=0 /usr/src/app/node_modules node_modules
RUN chown $USER:$USER $WORKDIR
COPY --chown=node . $WORKDIR

EXPOSE 22