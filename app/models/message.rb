class Message < ApplicationRecord
  validates :group_id, presence: true
  validates :user_id, presence: true
  validates :text_or_image, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :group
  belongs_to :user

  private
  def text_or_image
    body.presence || image.presence
  end

end
