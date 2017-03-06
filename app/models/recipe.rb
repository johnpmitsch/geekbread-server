class Recipe < ApplicationRecord
  has_many :ingredients, :dependent => :destroy
  belongs_to :user

  def levain_exists?
    self.ingredients.where(levain: true).present?
  end
end
