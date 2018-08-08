class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :email
    validates :password
  end

  def update_access_token!
    self.access_token = %Q(#{self.id}:#{Devise.friendly_token})
    save!
  end
end
