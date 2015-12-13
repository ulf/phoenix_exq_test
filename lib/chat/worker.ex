defmodule Worker do
  def perform(text) do
		Chat.Endpoint.broadcast("rooms:lobby", "new:msg", %{user: "bot", body: text})
  end
end
