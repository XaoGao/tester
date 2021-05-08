class PhonebookSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :name, :sort_level
  attribute :users do |object|
    result = []
    object.users.each do |user|
      result << {
        fullName: user.full_name,
        position: user.position.name,
        positionSortLevel: user.position.sort_level,
        phone: if user.phone.present?
                 user.phone.number
               else
                 ''
               end
      }
    end
    result
  end
end
