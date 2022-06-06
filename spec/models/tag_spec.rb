require 'rails_helper'

describe Tag do
  it { should have_and_belong_to_many :recipes }
  it { should validate_presence_of :category }
end

describe Tag do
  it("titleizes the category of a tag") do
    tag = Tag.create!({category: "vegan"})
    expect(tag.category).to eq "Vegan"
  end
end