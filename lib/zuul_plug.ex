defmodule Zuul.Plug do
  @moduledoc false

  def init(options), do: options

  defp get_authorization_header(conn) do
    conn
    |> Plug.Conn.get_req_header("authorization")
    |> List.first()
  end

  defp check_conn_authorization(conn, key_file_path) do
    conn
    |> get_authorization_header()
    |> Zuul.authenticate(key_file_path)
  end

  def call(conn, opts) do
    cond do
      get_authorization_header(conn) === nil -> raise(Zuul.MissingAuthorizedHeaderError)
      check_conn_authorization(conn, opts[:key_file]) === false -> raise(Zuul.KeyError)
      check_conn_authorization(conn, opts[:key_file]) === true -> conn
    end
  end
end
