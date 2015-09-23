FROM node:0.12.7

# install fontforge
RUN apt-get update && \
  apt-get -y install fontforge

# install node stuff
RUN npm install -g grunt-cli@0.1.13

# expose ports, establish entrypoint
WORKDIR /src
ENTRYPOINT ["/usr/local/bin/grunt"]
CMD ["build"]
