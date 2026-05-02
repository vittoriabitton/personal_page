defmodule PersonalPageWeb.TilLive do
  use PersonalPageWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "TIL — Vittoria Bitton")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-10">
      <div class="space-y-2">
        <h1 class="text-3xl font-bold text-text">TIL</h1>
        <p class="text-muted">
          Short enough to actually read. Code things, life things, whatever I felt like writing down and sharing.
        </p>
      </div>

      <div class="py-12 text-center text-muted">
        <p>Nothing posted yet. Check back soon!</p>
      </div>
    </div>
    """
  end
end
