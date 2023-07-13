FROM node:18-alpine AS deps-prod

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./
RUN npx pnpm -r i --frozen-lockfile --prod

# ? -------------------------

FROM node:18-alpine as builder

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./
RUN npx pnpm -r i --frozen-lockfile

COPY astro.config.mjs tailwind.config.cjs tsconfig.json ./
COPY public ./public
COPY src ./src

RUN npx pnpm build

# ? -------------------------

FROM node:18-alpine as runner

EXPOSE 8080

ENV NODE_ENV production
ENV PORT 8080
ENV TZ="Asia/Bangkok"

COPY --from=deps-prod /opt /

COPY package.json ./
COPY --from=deps-prod /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY server.mjs ./

CMD ["./server.mjs"]
