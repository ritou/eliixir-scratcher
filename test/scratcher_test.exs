defmodule ScratcherTest do
  use ExUnit.Case
  doctest Scratcher

  test "greets the world" do
    assert Scratcher.hello() == :world
  end
end
