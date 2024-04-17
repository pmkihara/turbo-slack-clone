class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :owned_channels, class_name: 'Channel', dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :channels, through: :memberships
  has_many :posts, dependent: :destroy

  # Callbacks
  before_save :fill_display_name

  private

  def fill_display_name
    return if display_name

    self.display_name = email.gsub(/@.+/, '')
  end
end
