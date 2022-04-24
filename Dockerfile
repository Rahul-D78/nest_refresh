FROM node:16-alpine as builder
ENV NODE_ENV build
# USER node
WORKDIR /home/node
COPY . /home/node
RUN yarn \
    && yarn audit --fix

# # ---

FROM node:16-alpine as prod
ENV NODE_ENV prod
# USER node
WORKDIR /home/node

COPY --from=builder /home/node/package*.json /home/node

RUN yarn

CMD ["yarn", "start"]