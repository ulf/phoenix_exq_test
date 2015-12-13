defmodule Chat.PageController do
  use Chat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

	def test(conn, params) do
		{:ok, ack} = Exq.enqueue(:exq, "default", "Worker", [params["text"]])
    text conn, "ok"
  end

	def delayed(conn, params) do
		{:ok, ack} = Exq.enqueue_in(:exq, "default", 10, "Worker", ["hello!"])
    text conn, "ok"
  end
end
