class Tag < ApplicationRecord
  has_and_belongs_to_many :recipes
  validates :category, presence: true
  before_save :titleize_tag

  # add scope?

  private
  def titleize_tag
    self.category = self.category.titleize
  end
end