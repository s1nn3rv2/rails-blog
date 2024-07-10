class User < ApplicationRecord
    after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :co_authors, dependent: :destroy

  has_many :blogs, dependent: :destroy
  has_many :coauthored_blogs, through: :co_authors, source: :blog
  has_many :posts

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, limit: 1

  private

  def create_profile
    unless self.profile.present?
      profile = self.build_profile(username: (0...8).map { (65 + rand(26)).chr }.join)
      profile.save!
    end
  end
end
