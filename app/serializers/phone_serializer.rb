# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  number     :string           default(""), not null
#  slug       :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PhoneSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :number
end
