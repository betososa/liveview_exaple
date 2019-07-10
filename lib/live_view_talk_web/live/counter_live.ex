defmodule LiveViewTalkWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <div>
        <h2>El contador es: <%= @val %> </h2>
        <button phx-click="dec">-</button>
        <button phx-click="inc">+</button>
      </div>
    """
  end

  def mount(session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _value, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _value, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end
end
