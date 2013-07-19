class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @products = Product.order(:title)
    session[:counter] = 0 if session[:counter].nil?
    count = session[:counter] += 1
    @count_message = "You've been here #{count} times since your last adding." if count >= 5
    @cart = current_cart
  end
end
