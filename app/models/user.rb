class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # constant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  VALID_PASSWORD_REGEX = /\A([\w]+)([@¥|\-]?)([-(-)]*){6,50}\z/

  before_save  do
    self.email = email.downcase
  end

  # validates
  with_options presence: true do
    validates :first_name
    validates :last_name
  end

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6, maximum: 50 }

  # association
  has_many :articles, dependent: :destroy
end
