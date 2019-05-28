defmodule Zuul do
  @moduledoc """
  Zuul is a dead (heh) simple gatekeeper for your Elixir applications.
  You give him a file with API keys, and it lets pass only authorized connections.
  """
  @doc """
  Get the sha256 digest corresponding to a string

  ## Examples

      iex> Zuul.sha256("amnesty-unburned-seas-limelight-bevel-serum")
      "6c9e6e032e72ff925a6930e8fe7757aca8fdd4dac2feefb54b2451916fb3fd9c"
  """
  def sha256(word) do
    :crypto.hash(:sha256, word) |> Base.encode16() |> String.downcase()
  end

  def authenticate(key, file_path) do
    encrypted_key = sha256(key)

    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.filter(fn row -> row !== "" end)
    |> Enum.map(fn row ->
      [_, sha256] = String.split(row, "=")
      sha256
    end)
    |> Enum.member?(encrypted_key)
  end
end
