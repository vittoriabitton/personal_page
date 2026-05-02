defmodule PersonalPageWeb.CoreComponents do
  use Phoenix.Component

  @doc """
  Renders a tag/badge.
  """
  attr :label, :string, required: true
  attr :class, :string, default: ""

  def tag(assigns) do
    ~H"""
    <span class={"inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-accent/10 text-accent dark:bg-accent/20 #{@class}"}>
      {@label}
    </span>
    """
  end

  @doc """
  Renders a flash notice.
  """
  attr :flash, :map, required: true
  attr :kind, :atom, values: [:info, :error]

  def flash(assigns) do
    ~H"""
    <div
      :if={msg = Phoenix.Flash.get(@flash, @kind)}
      role="alert"
      class={[
        "fixed top-4 right-4 z-50 rounded-lg p-4 text-sm shadow-lg max-w-sm",
        @kind == :info && "bg-emerald-50 text-emerald-800 dark:bg-emerald-900 dark:text-emerald-200",
        @kind == :error && "bg-red-50 text-red-800 dark:bg-red-900 dark:text-red-200"
      ]}
    >
      <p>{msg}</p>
    </div>
    """
  end

  @doc """
  Renders a back navigation link.
  """
  attr :navigate, :string, required: true
  slot :inner_block, required: true

  def back(assigns) do
    ~H"""
    <div class="mt-8">
      <.link
        navigate={@navigate}
        class="text-sm text-muted hover:text-accent transition-colors flex items-center gap-1"
      >
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
        </svg>
        {render_slot(@inner_block)}
      </.link>
    </div>
    """
  end

  @doc """
  Renders a social link icon.
  """
  attr :href, :string, required: true
  attr :label, :string, required: true
  slot :inner_block, required: true

  def social_link(assigns) do
    ~H"""
    <a
      href={@href}
      target="_blank"
      rel="noopener noreferrer"
      aria-label={@label}
      class="text-muted hover:text-accent transition-colors duration-200"
    >
      {render_slot(@inner_block)}
    </a>
    """
  end
end
