defmodule Allocs.Data do

  defmodule Resource do
    defstruct id: 0, name: "Resource", type: "Type"
  end

  defmodule User do
    defstruct id: 0, name: "User"
  end

  def resources do
    [
      %{id: 1, name: "Lenovo", type: "Hardware"},
      %{id: 2, name: "Canva Premium", type: "Software"},
      %{id: 3, name: "Mac Air", type: "Hardware"},
      %{id: 4, name: "MSI 24 MONITOR", type: "Peripheral"},
      %{id: 5, name: "G14 Zephyrus", type: "Hardware"}
    ]
  end

  def users do
    [
      %{id: 1, name: "Daryn Ongera"},
      %{id: 2, name: "Obi Wan"},
      %{id: 3, name: "John Doe"},
      %{id: 4, name: "Johnie Walker"},
      %{id: 5, name: "Elon Mareska"}
    ]
  end

  def allocations do
    time = NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)
    [
      %{
        id: 1,
        user: "Daryn Ongera",
        resource: "Lenovo",
        resource_type: "Hardware",
        user_id: 1,
        resource_id: 1,
        allocated_at: time
      }
    ]
  end

end
