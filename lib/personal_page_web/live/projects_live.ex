defmodule PersonalPageWeb.ProjectsLive do
  use PersonalPageWeb, :live_view

  @projects [
    %{
      name: "Nx Hailo",
      description:
        "Running ML pipelines on edge devices and leveraging its pipeline to be with Elixir, using the Hailo AI accelerator chip.",
      tags: ["elixir", "nx", "ai", "embedded", "computer vision"],
      github: "https://github.com/vittoriabitton/nx_hailo",
      demo: nil,
      year: "2024"
    }
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Projects — Vittoria Bitton")
     |> assign(:projects, @projects)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-10">
      <div class="space-y-2">
        <h1 class="text-3xl font-bold text-text">Projects</h1>
        <p class="text-muted">
          Things I've built, contributed to, or stayed up way too late debugging.
          Mostly Elixir. Always with love.
        </p>
      </div>

      <div class="space-y-6">
        <article
          :for={project <- @projects}
          class="group p-5 rounded-xl border border-border hover:border-accent/40 bg-surface/30 hover:bg-surface/60 transition-all duration-200"
        >
          <div class="space-y-3">
            <div class="flex items-start justify-between gap-4">
              <h2 class="font-semibold text-text group-hover:text-accent transition-colors duration-200 font-mono">
                {project.name}
              </h2>
              <span class="text-xs text-muted shrink-0">{project.year}</span>
            </div>

            <p class="text-sm text-muted leading-relaxed">
              {project.description}
            </p>

            <div class="flex items-center justify-between gap-4">
              <div class="flex gap-2 flex-wrap">
                <.tag :for={tag <- project.tags} label={tag} />
              </div>

              <div class="flex items-center gap-3 shrink-0">
                <a
                  :if={project.github}
                  href={project.github}
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-xs text-muted hover:text-accent transition-colors duration-200 flex items-center gap-1"
                >
                  <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12" />
                  </svg>
                  GitHub
                </a>
                <a
                  :if={project.demo}
                  href={project.demo}
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-xs text-accent hover:underline flex items-center gap-1"
                >
                  <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                  Demo
                </a>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
    """
  end
end
