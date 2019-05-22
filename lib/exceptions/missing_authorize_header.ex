defmodule Zuul.MissingAuthorizedHeaderError do
  @moduledoc """
  Error raised when an incoming connection doesn't have
  an authorization header.
  """

  defexception message: "Incoming request is missing a proper authorization."
end
