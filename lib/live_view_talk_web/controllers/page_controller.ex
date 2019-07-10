defmodule LiveViewTalkWeb.PageController do
  use LiveViewTalkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def snake(conn, _params) do
    conn
    |> put_layout(:demo)
    |> live_render(LiveViewTalkWeb.CounterLive.Demo, session: %{messages: ["1", "2"]})
  end
end
