class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_users
  has_many :users, through: :group_users
  # has_and_belongs_to_many :users
  has_many :messages
end
