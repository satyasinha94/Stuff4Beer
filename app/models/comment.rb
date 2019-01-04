class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  def find_user
    user = User.find(self.user_id)
  end

end
