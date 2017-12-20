class Message < ApplicationRecord
  validates :group_id, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :group
  belongs_to :user

  validates :text_or_image, presence: true

# binding.pry

  private
  def text_or_image
    body.presence || image.presence
  end


end
