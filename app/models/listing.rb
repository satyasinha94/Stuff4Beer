class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def find_category
    category = Category.find(self.category_id)
    category.name
  end

  def find_user
    user = User.find(self.user_id)
    user.name
  end
end
