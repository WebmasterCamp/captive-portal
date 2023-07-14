# captive-portal

Wifi captive portal for YWC19's network.

## Tech stacks

- Writtin in Astro framework
- Deploy via Docker image

## Usage

```sh
# Install and generate schema
pnpm i
pnpm prisma generate

# Develop
pnpm dev

# Build
pnpm build
```

Configure MicroTik router's `login.html` to send GET form to target site, ending with `/camper` path.
