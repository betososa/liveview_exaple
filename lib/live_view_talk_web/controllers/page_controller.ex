defmodule LiveViewTalkWeb.PageController do
  use LiveViewTalkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
