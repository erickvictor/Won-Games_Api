FROM strapi/base:14

WORKDIR /opt/app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install --prod

RUN npx browserslist@latest --update-db

COPY . .

ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres
ENV DATABASE_NAME="${DATABASE_NAME}"
ENV DATABASE_HOST="${DATABASE_HOST}"
ENV DATABASE_PORT="${DATABASE_PORT}"
ENV DATABASE_USERNAME="${DATABASE_USERNAME}"
ENV DATABASE_PASSWORD="${DATABASE_PASSWORD}"
ENV STRIPE_KEY="${STRIPE_KEY}"

RUN yarn build

EXPOSE 1337
CMD ["yarn", "start"]