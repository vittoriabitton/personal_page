defmodule PersonalPage.Post do
  @enforce_keys [:slug, :title, :date, :tags, :body]
  defstruct [:slug, :title, :date, :tags, :body]

  def build(filename, attrs, body) do
    slug =
      filename
      |> Path.basename(".md")
      |> String.split("-", parts: 4)
      |> List.last()

    struct!(__MODULE__, [slug: slug, body: body] ++ Map.to_list(attrs))
  end
end
