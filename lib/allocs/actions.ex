defmodule Allocs.Actions do
  alias Allocs.Data

  def list_resources() do
    Data.resources()
  end

  def list_users() do
    Data.users()
  end

  def list_allocations() do
    Data.allocations() 
    |> Enum.sort_by(&(&1.id), :asc)
  end

  def create_allocation(user_id, resource_id, all_allocations) do
    id = next_id(all_allocations)
    time = NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second) 
    resource = Enum.find(list_resources(), &(&1.id == resource_id))
    user = Enum.find(list_users(), &(&1.id == user_id))
    map = %{user: user.name, resource: resource.name, resource_type: resource.type, user_id: user.id, resource_id: resource.id, allocated_at: time}
    new_allocation = Map.put(map, :id, id)
    [new_allocation | all_allocations]
  end

  def get_allocation(current_list, id) do
    [Enum.find(current_list, &(&1.id == id))]
  end

  def get_user_allocation(current_list, user_id) do
   [Enum.filter(current_list, &(&1.user_id == user_id))]
  end

  def update_allocation(current_list, attrs) do
    updated_list = Enum.map(current_list, fn x ->
      if x.id == attrs.id do
        Map.merge(x, attrs)
      else
        x
      end
    end)
    updated_list
  end

  def delete_allocation(current_list, id) do
    case Enum.find(current_list, &(&1.id == id)) do
      nil -> current_list
      item -> updated_list = current_list -- [item]
        updated_list
    end
  end

  def verify_resource() do
  end

  def is_allocated() do 
  end

  def next_id(list) do
    list
    |> Enum.map(& &1.id)
    |> Enum.max()
    |> Kernel.+(1)
  end
end
