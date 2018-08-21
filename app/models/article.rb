class Article < ApplicationRecord
  # validation
  with_options presence: true do
    validates :title
    validates :body
  end

  # association
  belongs_to :user
end
