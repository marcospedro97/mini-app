class UserFavorite < ApplicationRecord
  belongs_to :task_list
  belongs_to :user

  validates :task_list, uniqueness: { scope: :user }
end
