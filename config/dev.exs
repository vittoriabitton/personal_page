import Config

config :personal_page, PersonalPageWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "dev_secret_key_base_replace_in_prod_xK8mP2qRnJ7sL9vT3wY1cE5aH6bG4dF",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:personal_page, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:personal_page, ~w(--watch)]}
  ]

config :personal_page, PersonalPageWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/personal_page_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view, debug_heex_annotations: true

config :personal_page, dev_routes: true
