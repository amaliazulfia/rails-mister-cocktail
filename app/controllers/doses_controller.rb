class DosesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
     @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
     if @dose.save
     redirect_to cocktail_path(@cocktail)
      else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
      @dose = Dose.find(params[:id])
      @dose.destroy
      @cocktail = @dose.cocktail
     redirect_to cocktail_path(@cocktail)

  end


    def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
