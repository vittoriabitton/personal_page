defmodule PersonalPageWeb.TilLive.Show do
  use PersonalPageWeb, :live_view

  alias PersonalPage.Til

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"slug" => slug}, _uri, socket) do
    case Til.get_post_by_slug(slug) do
      nil ->
        {:noreply, push_navigate(socket, to: ~p"/til")}

      post ->
        {:noreply,
         socket
         |> assign(:page_title, "#{post.title} — Vittoria Bitton")
         |> assign(:post, post)}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-8">
      <.back navigate={~p"/til"}>Back to TIL</.back>

      <article class="space-y-6">
        <header class="space-y-3">
          <div class="flex items-center gap-2 flex-wrap">
            <.tag :for={tag <- @post.tags} label={tag} />
          </div>
          <h1 class="text-2xl font-bold text-text leading-tight">
            {@post.title}
          </h1>
          <time datetime={@post.date} class="text-sm text-muted block">
            {Calendar.strftime(@post.date, "%B %d, %Y")}
          </time>
        </header>

        <div class="prose-vb">
          {raw(@post.body)}
        </div>
      </article>
    </div>
    """
  end
end
