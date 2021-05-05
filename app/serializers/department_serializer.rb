# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           not null
#  sort_level :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DepartmentSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :name
end
