class Group < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users

  has_and_belongs_to_many :users
end
