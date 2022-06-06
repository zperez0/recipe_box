require 'rails_helper'

describe Recipe do
  it { should have_and_belong_to_many  :tags }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_most(50) }
  it { should validate_length_of(:title).is_at_least(3) }
  it { should validate_presence_of :ingredient }
  it { should validate_presence_of :instruction }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
end

describe Recipe do
  it("titleizes the title of a recipe") do
    recipe = Recipe.create!({title: "cheese burger", ingredient: "vegan beef, cheese, buns", instruction: "put the meat on the bun", content_body: "this tastes great", rating: 5 })
    expect(recipe.title).to eq "Cheese Burger"
  end
end