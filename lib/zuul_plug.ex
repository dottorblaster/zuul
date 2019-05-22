defmodule Zuul.Plug do
  @moduledoc false

  def init(options), do: options

  defp get_authorization_header(conn) do
    conn
    |> Plug.Conn.get_req_header("authorization")
    |> List.first()
  end

  def call(conn, opts) do
    if get_authorization_header(conn) === nil, do: raise(Zuul.MissingAuthorizedHeaderError)

    is_ok =
      conn
      |> get_authorization_header()
      |> Zuul.authenticate(opts[:key_file])

    case is_ok do
      true -> conn
      false -> raise(Zuul.KeyError)
    end
  end
end
