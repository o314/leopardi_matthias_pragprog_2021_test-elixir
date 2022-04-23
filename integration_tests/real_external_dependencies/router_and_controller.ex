#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
defmodule MyApp.Router do
  route(
    "POST",
    "/create_article",
    {MyApp.ArticleController, :create_article}
  )
end

defmodule MyApp.ArticleController do
  def create_article(connection, params) do
    article = %Article{
      title: params["title"],
      body: params["body"],
      author_email: params["author_email"]
    }

    article_id = Database.create(article)

    send_response(connection, _status_code = 200, %{article_id: article_id})
  end
end
