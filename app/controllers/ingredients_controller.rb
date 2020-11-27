class IngredientsController < ApplicationController
  def show

  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Review.new


  end

  def create
     @cocktail = Cocktail.find(params[:cocktail_id])
      @ingredient = Review.new(review_params)
      @ingredient.restaurant = @restaurant
     if @ingredient.save
     redirect_to restaurant_path(@restaurant)
      else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

   def review_params
    params.require(:review).permit( :content, :rating )
  end
end
