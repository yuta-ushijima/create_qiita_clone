class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :created_at

  belongs_to :user, serializer: UserSerializer

  def created_at
    object.created_at.strftime('%Y年%m月%d日')
  end
end