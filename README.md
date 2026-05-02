# personal_page

A personal website built with [Phoenix LiveView](https://hex.pm/packages/phoenix_live_view) and deployed on [Fly.io](https://fly.io).

## Stack

- **[Phoenix LiveView](https://hex.pm/packages/phoenix_live_view)** real-time server-rendered UI without writing JavaScript
- **[Ecto](https://hex.pm/packages/ecto) + PostgreSQL** TIL posts stored in a database
- **[Tailwind CSS](https://tailwindcss.com)** styling via utility classes
- **[Fly.io](https://fly.io)** hosting with zero-downtime deploys

## Local development

**Prerequisites:** Elixir 1.19+, PostgreSQL

```bash
mix deps.get
mix ecto.setup
mix phx.server
```

Open [localhost:4000](http://localhost:4000).

## Deployment

```bash
fly deploy
```

Fly reads the `Dockerfile` and `fly.toml` at the repo root. The app runs as an Elixir release with migrations applied at startup via `PersonalPage.Release.migrate/0`.
