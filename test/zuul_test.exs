defmodule ZuulTest do
  use ExUnit.Case
  doctest Zuul

  test "greets the world" do
    assert Zuul.hello() == :world
  end
end
