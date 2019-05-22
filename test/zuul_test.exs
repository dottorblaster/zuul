defmodule ZuulTest do
  use ExUnit.Case
  doctest Zuul

  test "authentication succeeds" do
    assert Zuul.authenticate("correct-horse-battery-staples", "./test/fixtures/api_keys.txt") ===
             true

    assert Zuul.authenticate("verified-lmao-nyan-cat", "./test/fixtures/api_keys.txt") === true
  end

  test "authentication fails" do
    assert Zuul.authenticate("lmao-top-kek", "./test/fixtures/api_keys.txt") === false
    assert Zuul.authenticate("this-is-a-wrong-key", "./test/fixtures/api_keys.txt") === false
  end
end
