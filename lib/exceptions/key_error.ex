defmodule Zuul.KeyError do
  @moduledoc """
  Error raised when provided key is not found
  """

  defexception message: "Provided key is not found."
end
