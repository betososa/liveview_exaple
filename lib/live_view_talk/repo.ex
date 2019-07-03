defmodule LiveViewTalk.Repo do
  use Ecto.Repo,
    otp_app: :live_view_talk,
    adapter: Ecto.Adapters.Postgres
end
