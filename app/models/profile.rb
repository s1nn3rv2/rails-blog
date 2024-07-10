require 'icodi'

class Profile < ApplicationRecord
  # extend FriendlyId
  # friendly_id :username, use: :slugged

  after_create :attach_default_avatar

  has_one_attached :avatar

  belongs_to :user

  validates :username, presence: true, uniqueness: { case_sensitive: true }

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def attach_default_avatar
    unless avatar.attached?
      identicon = Icodi.new(user.email)

      avatar.attach(
        io: StringIO.new(identicon.render),
        filename: 'avatar.svg',
        content_type: 'image/svg+xml'
      )
    end
  end
end
