FROM node:16-alpine3.14 AS base
RUN apk add git curl

FROM base AS hardhat
COPY packages/hardhat /home/node/hardhat
# Prevent post-deploy error from publish.js. Will be removed once subgraph support is added.
RUN mkdir -p /home/node/subgraph/config
WORKDIR /home/node/hardhat
RUN yarn install
CMD ["yarn", "chain"]
EXPOSE 8545

FROM base AS react-app
COPY packages/react-app /home/node/react-app
WORKDIR /home/node/react-app
RUN yarn install
CMD ["yarn", "start"]
EXPOSE 3000