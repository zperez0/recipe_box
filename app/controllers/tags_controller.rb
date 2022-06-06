class TagsController < ApplicationController
  
  
  def index
    @tags = Tag.all
    render :index
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipe.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Oops..looks like there was an error in creating your tag. Try again."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    render :show
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag sucessfully updated"
      redirect_to recipe_path(@tag.recipe)
    else
      flash[:alert] = "Oops..looks like there was an error in updating your tag. Try again."
      @recipe = Recipe.find(params[:recipe_id])
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to recipe_path(@tag.review)
  end

  private

  def tag_params
    params.require(:tag).permit(:category)
  end
end