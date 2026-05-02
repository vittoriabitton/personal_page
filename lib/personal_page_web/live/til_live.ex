defmodule PersonalPageWeb.TilLive do
  use PersonalPageWeb, :live_view

  alias PersonalPage.Til

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "TIL — Vittoria Bitton")
     |> assign(:posts, Til.all_posts())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-10">
      <div class="space-y-2">
        <h1 class="text-3xl font-bold text-text">TIL</h1>
        <p class="text-muted">
          Short enough to actually read. Code things, life things, whatever I felt like writing down.
        </p>
      </div>

      <div class="space-y-0 divide-y divide-border">
        <article :for={post <- @posts} class="py-5 group">
          <.link navigate={~p"/til/#{post.slug}"} class="block space-y-2">
            <div class="flex items-start justify-between gap-4">
              <h2 class="text-base font-medium text-text group-hover:text-accent transition-colors duration-200">
                {post.title}
              </h2>
              <time datetime={post.date} class="text-xs text-muted shrink-0 pt-0.5">
                {Calendar.strftime(post.date, "%b %d, %Y")}
              </time>
            </div>
            <div class="flex items-center gap-2 flex-wrap">
              <.tag :for={tag <- post.tags} label={tag} />
            </div>
          </.link>
        </article>

        <div :if={Enum.empty?(@posts)} class="py-12 text-center text-muted">
          <p>Nothing posted yet. Check back soon!</p>
        </div>
      </div>
    </div>
    """
  end
end
