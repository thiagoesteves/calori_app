defmodule CaloriAppWeb.PageController do
  use CaloriAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
