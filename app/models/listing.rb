class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  def find_category
    category = Category.find(self.category_id)
    category.name
  end

  def find_user
    user = User.find(self.user_id)
  end

  def date_time
    self.created_at.strftime("%B %d %Y")
  end
end
