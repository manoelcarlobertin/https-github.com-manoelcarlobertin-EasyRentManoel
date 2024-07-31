class CustomersController < ApplicationController
  before_action :load_customer, only: %i[show edit update destroy]
  def index
    @customers = Customer.order(:name)

  end

  def show
    
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params

    if @customer.save
      redirect_to customer_path, status: :ok, notice: "Succeful Client Cadastred !!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email, :address)
  end

  def load_customer
    @customers = Customer.find params(:id)
  end
end
