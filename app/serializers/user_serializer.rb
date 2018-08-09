class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :full_name

  def full_name
    %Q(#{object.first_name} #{object.last_name})
  end
end

