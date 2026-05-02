defmodule PersonalPage.Til do
  use NimblePublisher,
    build: PersonalPage.Post,
    from: Application.app_dir(:personal_page, "priv/posts/**/*.md"),
    as: :posts

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  def all_posts, do: @posts

  def get_post_by_slug(slug), do: Enum.find(@posts, &(&1.slug == slug))
end
