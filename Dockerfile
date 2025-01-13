FROM node:16.20.2-alpine

WORKDIR /backend

# Copy environment file
COPY ./backend/.env.example /backend/.env

# Copy package files
COPY backend/package.json backend/yarn.lock ./

RUN yarn install

# Copy application files
COPY backend/src ./src

# Ensure upload directory exists
RUN mkdir -p ./upload

# Optional: If upload directory exists locally, copy it
COPY backend/upload ./upload

EXPOSE 3000

CMD ["yarn", "start"]