# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  access_token           :string(255)
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  allow_password_change  :boolean          default(FALSE)
#  image                  :string(255)
#  tokens                 :text(65535)
#

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
  # FIXME: バリデーションの謎が解けるまで、一旦コメントアウト
  # validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6, maximum: 50 }

  # association
  has_many :articles, dependent: :destroy
end
