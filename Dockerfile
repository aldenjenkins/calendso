## Dockerfile

FROM node:alpine
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -S app
COPY . .
RUN yarn install \
    && npx next build \
		&& chown -R app /opt/app
USER app
EXPOSE 3000
CMD ["yarn", "start"]
