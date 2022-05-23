FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16-bullseye

#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#    && apt-get -y install --no-install-recommends git curl

#RUN apk add git curl
#FROM base AS hardhat
#COPY packages/hardhat /home/node/hardhat
# Prevent post-deploy error from publish.js. Will be removed once subgraph support is added.
#RUN mkdir -p /home/node/subgraph/config
#WORKDIR /workspaces/scaffold-eth
ADD package.json ./
#ADD packages ./packages
#RUN cd packages/hardhat && yarn install
#RUN cd packages/react-app && yarn install
RUN npx browserslist@latest --update-db

EXPOSE 8545
EXPOSE 3000