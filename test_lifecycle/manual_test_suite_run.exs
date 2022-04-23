#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
ExUnit.start(autorun: false)

IO.puts("About to run the test suite!")

result = ExUnit.run()

IO.puts("The test suite finished running.")
IO.puts("The result is: #{inspect(result)}")
