class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all.order(:name)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail successfully created'
    else
      render :new
    end
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
    # params.require(:ingredients).permit(:name)
    # params.require(:doses).permit(:description)
  end

end
