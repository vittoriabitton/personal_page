defmodule PersonalPage.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias PersonalPage.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import PersonalPage.DataCase
    end
  end

  setup tags do
    PersonalPage.DataCase.setup_sandbox(tags)
    :ok
  end

  def setup_sandbox(tags) do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(PersonalPage.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
  end
end
