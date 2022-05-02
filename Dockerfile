FROM node:16-alpine as builder

WORKDIR /workspace

COPY package.json yarn.lock /workspace

RUN yarn

COPY . .

RUN yarn build

CMD ["yarn", "start"]


# FROM node:16-alpine as builder
# ENV NODE_ENV build
# # USER node
# WORKDIR /home/node
# COPY . /home/node
# RUN yarn \
#     && yarn audit --fix

# # # ---

# FROM node:16-alpine as prod
# ENV NODE_ENV prod
# # USER node
# WORKDIR /home/node

# COPY --from=builder /home/node/package*.json /home/node
# COPY --from=builder /home/node/tsconfig.json /home/node

# RUN yarn

# CMD ["nest", "start"]