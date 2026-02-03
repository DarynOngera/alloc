defmodule AllocsWeb.PageController do
  use AllocsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
