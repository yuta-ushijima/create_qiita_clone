class ArticleSerializer < ActiveModel::Serializer
  attributes :body, :title

  belongs_to :user
end
