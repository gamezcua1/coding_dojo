defmodule SwimTest do
  use ExUnit.Case
  doctest Swim

  test "greets the world" do
    assert Swim.hello() == :world
  end
end
