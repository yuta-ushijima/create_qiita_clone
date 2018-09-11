# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)
#

class Article < ApplicationRecord
  extend Enumerize

  # association
  belongs_to :user

  # validation
  with_options presence: true do
    validates :title
    validates :body
  end

  # enumerize
  enumerize :status, in: [:draft, :published], default: :draft, scope: true, predicate: true

  # scope
  scope :active, -> {
    without_status(:draft)
  }
end
