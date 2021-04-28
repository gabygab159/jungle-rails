class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count
    @categories = Product.count
  end
end
