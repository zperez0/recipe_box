class RecipesController < ApplicationController

    # WIP: add tags
  
    def index
      @recipes = Recipe.all
      render :index
    end
  
    def new
      @recipe = Recipe.new
      @tags = Tag.all
      render :new
    end
  
    def create
      @recipe = Recipe.new(recipes_params.except(:tags))
      create_or_delete_posts_tags(@recipe, params[:recipe][:tags])

      if @recipe.save
        flash[:notice] = "Recipe successfully added!"
        redirect_to recipes_path
      else
        flash[:alert] = "Oops..Looks like there was an error in creating your recipe. Try again."
        render :new
      end
    end
  
    def edit
      @recipe = Recipe.find(params[:id])
      render :edit
    end
  
    def show
      @recipe = Recipe.find(params[:id])
      render :show
    end
  
    def update
      @recipe = Recipe.find(params[:id])
      create_or_delete_posts_tags(@recipe, params[:recipe][:tags])

      if @recipe.update(recipes_params.except(:tags))
        flash[:notice]= "Recipe successfully updated"
        redirect_to recipes_path
      else
        flash[:alert] = "Oops..Looks like there was an error in updating your recipe. Try again."
        render :edit
      end
    end
  
    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to recipes_path
    end
  
    private

    def recipes_params
      params.require(:recipe).permit(:title, :ingredient, :instruction, :content_body, :rating, :tag )
    end
  end