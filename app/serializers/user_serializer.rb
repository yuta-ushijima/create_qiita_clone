class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :fullname

  def fullname
    "#{object.last_name} #{object.first_name}"
  end

  has_many :articles
end