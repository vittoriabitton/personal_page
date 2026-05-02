import Config

config :personal_page, PersonalPageWeb.Endpoint,
  url: [host: "vittoriabitton.blog", port: 443, scheme: "https"],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
