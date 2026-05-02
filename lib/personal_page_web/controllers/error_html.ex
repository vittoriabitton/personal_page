defmodule PersonalPageWeb.ErrorHTML do
  use PersonalPageWeb, :html

  def render("404.html", assigns) do
    ~H"""
    <div class="min-h-screen flex items-center justify-center">
      <div class="text-center space-y-4">
        <div class="text-6xl">🐱</div>
        <h1 class="text-4xl font-bold text-text">404</h1>
        <p class="text-muted">Oops, the lucky cat couldn't find this page.</p>
        <a href="/" class="inline-block mt-4 text-accent hover:underline">Go home →</a>
      </div>
    </div>
    """
  end

  def render("500.html", assigns) do
    ~H"""
    <div class="min-h-screen flex items-center justify-center">
      <div class="text-center space-y-4">
        <div class="text-6xl">😿</div>
        <h1 class="text-4xl font-bold text-text">500</h1>
        <p class="text-muted">Something went wrong on my end. Working on it!</p>
        <a href="/" class="inline-block mt-4 text-accent hover:underline">Go home →</a>
      </div>
    </div>
    """
  end

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
