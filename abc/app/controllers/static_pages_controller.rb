class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
    if signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
