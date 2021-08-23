class ToppagesController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.order(id: :desc), items: 25)
  end
end
