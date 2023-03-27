class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Callbacks
  before_save :fill_display_name

  private

  def fill_display_name
    return if display_name

    self.display_name = email.gsub(/@.+/, '')
  end
end
