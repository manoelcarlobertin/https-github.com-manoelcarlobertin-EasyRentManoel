class OrdersController < ApplicationController
  before_action :load_order, only: %i[show edit update destroy]

  def index
    @order = Order(:created_at)
  end

  

end
