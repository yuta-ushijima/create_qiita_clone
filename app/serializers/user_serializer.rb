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

class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :full_name, :email

  def full_name
    "#{object.last_name} #{object.first_name}"
  end

  has_many :articles
end
