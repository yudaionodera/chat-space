class Message < ApplicationRecord
  validates :group_id, presence: true
  validates :user_id, presence: true

  belongs_to :group
  belongs_to :user

  validates :body, presence: true if validates :image, absence: true
  validates :image, presence: true if validates :body, absence: true


  mount_uploader :image, ImageUploader
end
