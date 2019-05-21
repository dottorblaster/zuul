defmodule ZuulTest do
  use ExUnit.Case
  doctest Zuul

  test "authentication succeeds" do
    assert Zuul.authenticate("topkek", "zuul" "./test/fixtures/api_keys.txt") === true
  end
end
