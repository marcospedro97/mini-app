class UserFavorite < ApplicationRecord
  belongs_to :task_list
  belongs_to :user

  before_create :validate_unique

  private

  def validate_unique
    if self.where(user_id: user_id, task_list_id: task_list_id).any?
      return errors.add(:user_favorite, 'já é favorito')
    end
  end
end
