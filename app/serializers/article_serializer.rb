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

class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :created_at

  belongs_to :user, serializer: UserSerializer

  def created_at
    object.created_at.strftime("%Y年%m月%d日")
  end
end
