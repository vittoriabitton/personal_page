defmodule PersonalPageWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      summary("phoenix.endpoint.start.system_time", unit: {:native, :millisecond}),
      summary("phoenix.endpoint.stop.duration", unit: {:native, :millisecond}),
      summary("phoenix.router_dispatch.start.system_time", unit: {:native, :millisecond}),
      summary("phoenix.router_dispatch.exception.duration", unit: {:native, :millisecond}),
      summary("phoenix.router_dispatch.stop.duration", unit: {:native, :millisecond}),
      summary("phoenix.socket_connected.duration", unit: {:native, :millisecond}),
      summary("phoenix.channel_join.duration", unit: {:native, :millisecond}),
      summary("phoenix.channel_handled_in.duration", unit: {:native, :millisecond}),
      summary("ecto.repo.query.total_time", unit: {:native, :millisecond}),
      summary("ecto.repo.query.decode_time", unit: {:native, :millisecond}),
      summary("ecto.repo.query.query_time", unit: {:native, :millisecond}),
      summary("ecto.repo.query.queue_time", unit: {:native, :millisecond}),
      summary("ecto.repo.query.idle_time", unit: {:native, :millisecond}),
      summary("personal_page.repo.init.total_time", unit: {:native, :millisecond}),
      last_value("personal_page.prom_ex.scrape.duration", unit: {:native, :millisecond}),
      last_value("vm.memory.total", unit: :byte),
      last_value("vm.total_run_queue_lengths.total"),
      last_value("vm.total_run_queue_lengths.cpu"),
      last_value("vm.total_run_queue_lengths.io")
    ]
  end

  defp periodic_measurements do
    []
  end
end
