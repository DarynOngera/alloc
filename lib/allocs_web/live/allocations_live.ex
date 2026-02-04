defmodule AllocsWeb.AllocationsLive do 
  use AllocsWeb, :live_view
  alias Allocs.Actions

  def mount(_params, _session, socket) do
    all_users = Actions.list_users()
    all_resources = Actions.list_resources()
    all_allocations = Actions.list_allocations()

    {:ok,
      socket
      |> assign(:all_users, all_users)
      |> assign(:all_resources, all_resources)
      |> assign(:all_allocations, all_allocations)
      |> assign(:active_tab, :allocations)
    }
  end

  def handle_event("show_allocations", _params, socket) do
    {:noreply, assign(socket, :active_tab, :allocations)}
  end
  
  def handle_event("show_resources", _params, socket) do
    {:noreply, assign(socket, :active_tab, :resources)}
  end
  
  def handle_event("show_users", _params, socket) do
    {:noreply, assign(socket, :active_tab, :users)}
  end
  
  def handle_event("create_allocation", %{"user_id" => user_id, "resource_id" => resource_id}, socket) do
    user_id = String.to_integer(user_id)
    resource_id = String.to_integer(resource_id)
    result = Actions.create_allocation(user_id, resource_id, socket.assigns.all_allocations)
    {:noreply, assign(socket, :all_allocations, result)}
  end

  def handle_event("list_allocations", _params, socket) do
    all_allocations = socket.assigns.all_allocations
    sorted = Enum.sort_by(all_allocations, &(&1.id), :asc)
    {:noreply, assign(socket, :all_allocations, sorted)}
  end

  def handle_event("get_allocation", %{"allocation_id" => allocation_id}, socket) do
    id = String.to_integer(allocation_id)
    current_list = socket.assigns.all_allocations
    allocation = Actions.get_allocation(current_list, id)
    {:noreply, assign(socket, :all_allocations, allocation)}

  end

  def handle_event("user_allocation", %{"user_id" => user_id}, socket) do
    id = String.to_integer(user_id)
    current_list = socket.assigns.all_allocations
    user_allocations = Actions.get_user_allocation(current_list, id)
    {:noreply, assign(socket, :all_allocations, user_allocations)}
  end

  def handle_event("list_users", _params, socket) do
    all_users = socket.assigns.all_users
    {:noreply, assign(socket, :all_users, all_users)}
  end

  def handle_event("list_resources", _params, socket) do
    all_resources = socket.assigns.all_resources
    {:noreply, assign(socket, :all_resources, all_resources)}
  end

  def handle_event("delete_allocation", %{"allocation_id" => allocation_id}, socket) do
    id = String.to_integer(allocation_id)
    current_list = socket.assigns.all_allocations
    updated_list = Actions.delete_allocation(current_list, id)
    {:noreply, assign(socket, :all_allocations, updated_list)}
  end
end
