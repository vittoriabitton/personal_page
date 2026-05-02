import Config

config :personal_page, PersonalPage.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "personal_page_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

config :personal_page, PersonalPageWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "test_secret_key_base_replace_in_prod_xK8mP2qRnJ7sL9vT3wY1cE5aH6bG4dF",
  server: false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime

config :swoosh, :api_client, false
