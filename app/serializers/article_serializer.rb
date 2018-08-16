class ArticleSerializer < ActiveModel::Serializer
  attributes :body, :title, :created

  belongs_to :user, serializer: UserSerializer

  def created
    object.created_at.strftime('%Y年%m月%d日')
  end
end
