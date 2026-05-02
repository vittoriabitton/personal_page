defmodule PersonalPage.Repo.Migrations.CreateTilPosts do
  use Ecto.Migration

  def change do
    create table(:til_posts) do
      add :title, :string, null: false
      add :body, :text, null: false
      add :slug, :string, null: false
      add :tags, {:array, :string}, default: []
      add :published, :boolean, default: true, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:til_posts, [:slug])
    create index(:til_posts, [:published])
    create index(:til_posts, [:inserted_at])
  end
end
