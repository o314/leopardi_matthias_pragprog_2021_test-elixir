#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
# We use an empty list of formatters so that ExUnit doesn't
# output anything on the standard output.
ExUnit.start(autorun: false, formatters: [])

defmodule TestCaseExampleTest do
  use ExUnit.Case

  setup_all do
    IO.puts("setup_all #1 in process: #{inspect(self())}")
  end

  setup_all do
    IO.puts("setup_all callback #2 in process: #{inspect(self())}")
  end

  setup do
    IO.puts("setup callback #1 in process: #{inspect(self())}")
  end

  setup do
    IO.puts("setup callback #2 in process: #{inspect(self())}")
  end

  test "#1" do
    on_exit(fn ->
      IO.puts(
        "on_exit callback #1 (test #1) in process: #{inspect(self())}"
      )
    end)

    on_exit(fn ->
      IO.puts(
        "on_exit callback #2 (test #1) in process: #{inspect(self())}"
      )
    end)

    IO.puts("test #1 in process: #{inspect(self())}")
  end

  test "#2" do
    IO.puts("test #2 in process: #{inspect(self())}")
  end
end

result = ExUnit.run()

IO.puts("The return value of ExUnit.run/0 is:")
IO.inspect(result)
