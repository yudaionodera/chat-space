class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :groups
end
