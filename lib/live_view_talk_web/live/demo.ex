defmodule LiveViewTalkWeb.CounterLive.Demo do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <div>
        <form phx-submit="submit">
          <input type="text" name="m" value="<%= @message %>" placeholder="Mensaje" />
          <%= if @loading do %>
            <h1>loading ...</h1>
          <% end %>
        </form>
        <div>
          <ul>
            <%= for m <- @messages  do %>
              <li><%= m %></li>
            <% end %>
          </ul>
        </div>
      </div>
    """
  end

  def mount(_session, socket) do
    LiveViewTalkWeb.Endpoint.subscribe("chat")
    {:ok, assign(socket, message: nil, messages: [], loading: false)}
  end

  def handle_event("submit", %{"m" => message}, socket) do
    send(self(), {:add, message})
    LiveViewTalkWeb.Endpoint.broadcast_from(self(), "chat", "new_message", %{messages: socket.assigns.messages ++ [message]})
    {:noreply, assign(socket, loading: true)}
  end

  def handle_info({:add, message}, socket) do
    {:noreply, assign(socket, loading: false, messages: socket.assigns.messages ++ [message])}
  end

  def handle_info(%{event: "new_message", payload: state}, socket) do
    IO.inspect(state, label: "broadcast")
    {:noreply, assign(socket, state)}
  end
end
