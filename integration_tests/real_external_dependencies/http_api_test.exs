#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
defmodule HTTPAPITest do
  use ExUnit.Case

  test "articles are created correctly" do
    params = %{
      "title" => "My article",
      "body" => "The body of the article",
      "author_email" => "me@example.com"
    }

    response = simulate_http_call("POST", "/create_article", params)

    assert response.status == 200
    assert %{"article_id" => article_id} = response.body

    assert {:ok, article} = Database.fetch_by_id(Article, article_id)
    assert article.title == "My article"
    assert article.body == "The body of the article"
    assert article.author_email == "me@example.com"
  end
end
