class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_then_or_equal_to: 0.01}

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Some')
      return false
    end
  end

end
