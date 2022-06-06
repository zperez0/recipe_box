class Recipe < ApplicationRecord
  has_and_belongs_to_many :tags, dependent: :destroy
  validates :title, presence: true
  validates :ingredient, presence: true
  validates :instruction, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :title, minimum: 3, maximum: 50
  before_save :titleize_recipe

  # add scope

  private
  def titleize_recipe
    self.title = self.title.titleize
  end
end