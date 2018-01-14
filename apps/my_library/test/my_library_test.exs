defmodule MyLibraryTest do
  use ExUnit.Case
  doctest MyLibrary

  test "greets the world" do
    assert MyLibrary.hello() == :world
  end
end
