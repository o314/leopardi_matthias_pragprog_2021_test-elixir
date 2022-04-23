#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
defmodule SoggyWaffle.WeatherAPI.ResponseParserTest do
  use ExUnit.Case
  alias SoggyWaffle.WeatherAPI.ResponseParser

  # weather codes come from: https://openweathermap.org/weather-condition
  @thunderstorm_ids {
    "thunderstorm",
    [200, 201, 202, 210, 211, 212, 221, 230, 231, 232]
  }
  @drizzle_ids {"drizzle", [300, 301, 302, 310, 311, 312, 313, 314, 321]}
  @rain_ids {"rain", [500, 501, 502, 503, 504, 511, 520, 521, 522, 531]}

  for {condition, ids} <- [@thunderstorm_ids, @drizzle_ids, @rain_ids] do
    test "success: recognizes #{condition} as a rainy condition" do
      now_unix = DateTime.utc_now() |> DateTime.to_unix()

      for id <- unquote(ids) do
        record = %{"dt" => now_unix, "weather" => [%{"id" => id}]}

        assert {:ok, [weather_struct]} =
                ResponseParser.parse_response(%{"list" => [record]})

        assert weather_struct.rain? == true
      end
    end
  end
end
