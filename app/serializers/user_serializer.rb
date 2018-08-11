class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :full_name

  def full_name
    "#{object.last_name} #{object.first_name})"
  end
end