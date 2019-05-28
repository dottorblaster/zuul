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

  defp get_protected_methods(opts) do
    case List.keytake(opts, :protect_methods, 0) do
      nil -> nil
      {{_, value}, _} -> value
    end
  end

  defp list_has(element, list) do
    case Enum.find(list, fn i -> i === element end) do
      nil -> false
      _ -> true
    end
  end

  def call(conn, opts) do
    protected_methods = get_protected_methods(opts)

    cond do
      protected_methods !== nil &&
          !list_has(conn.method, protected_methods) ->
        conn

      get_authorization_header(conn) === nil ->
        raise(Zuul.MissingAuthorizedHeaderError)

      check_conn_authorization(conn, opts[:key_file]) === false ->
        raise(Zuul.KeyError)

      check_conn_authorization(conn, opts[:key_file]) === true ->
        conn
    end
  end
end
