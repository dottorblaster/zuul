defmodule Zuul do
  @moduledoc """
  Zuul is a dead (heh) simple gatekeeper for your Elixir applications.
  You give him a file with API keys, and it lets pass only authorized connections.
  """

  def authenticate(key, salt, file_path) do
    keys = file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn row ->
      [holder, key] = String.split(row, "=")
      key
    end)
    
  end
end
