defmodule Allocs.Data do

  defmodule Resource do
    defstruct id: 0, name: "Resource", type: "Type"
  end

  defmodule User do
    defstruct id: 0, name: "User"
  end

  defmodule Allocation do
    defstruct id: 0, user: "User", resource: "Resource", resource_type: "Type", user_id: 0, resource_id: 0, allocated_at: nil
  end

  def resources do
    [
      %Resource{id: 1, name: "Lenovo", type: "Hardware"},
      %Resource{id: 2, name: "Canva Premium", type: "Software"},
      %Resource{id: 3, name: "Mac Air", type: "Hardware"},
      %Resource{id: 4, name: "MSI 24 MONITOR", type: "Peripheral"},
      %Resource{id: 5, name: "G14 Zephyrus", type: "Hardware"}
    ]
  end

  def users do
    [
      %User{id: 1, name: "Daryn Ongera"},
      %User{id: 2, name: "Obi Wan"},
      %User{id: 3, name: "John Doe"},
      %User{id: 4, name: "Johnie Walker"},
      %User{id: 5, name: "Elon Mareska"}
    ]
  end

  def allocations do
    time = NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)
    [
      %Allocation{
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
