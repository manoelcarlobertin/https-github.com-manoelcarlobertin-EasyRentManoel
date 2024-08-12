class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: %i[show edit update destroy]
  def index
    @customers = Customer.order(:name)
    authorize @customers
  end

  def show
    authorize @customer
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, status: :ok, notice: "Succefull Cadastred Customer!!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_params, notice: "Succefull Updated Custumer!!" }
        else
          format.html { render  :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @customer

    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Succefull Removed Custumer!!" }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email, :address)
  end

  def load_customer
    @customer = Customer.find(params[:id])
  end
end
