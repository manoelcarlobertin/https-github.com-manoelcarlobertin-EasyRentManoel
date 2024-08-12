class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[show edit update destroy]

  def index
    @equipaments = Equipament.order(:name, :serial_number)
  end

  def show
    authorize @equipament
  end

  def new
    @equipament = Equipament.new
  end

  def create
    @equipament = Equipament.new(equipament_params)
    authorize @equipament

    respond_to do |format|
      if @equipament.save
        format.html { redirect_to equipaments_url, status: :ok, notice: "Succefull Cadastred Equipament!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @equipament
  end

  def update
    authorize @equipament

    respond_to do |format|
      if @equipament.update(equipament_params)
        format.html { redirect_to equipament_params, notice: "Succefull Updated Equipament!" }
        else
          format.html { render  :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @equipament

    @equipament.destroy

    respond_to do |format|
      format.html { redirect_to equipaments_url, notice: "Succefull Removed Equipament!" }
    end
  end

  private

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number, :description)
  end

  def load_equipament
    @equipament = Equipament.find(params[:id])
  end
end
