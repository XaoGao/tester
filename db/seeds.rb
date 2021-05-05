require 'faker'

# %w[doctor patient hr registrar admin].each do |role|
#   Role.create(name: role)
# end

# ['default', 'Администрация', 'Отдел кадров', 'Бухгалтерия', 'Системное программирования'].each_with_index do |p, i|
#   Position.create(name: p, lock: false, sort_level: i)
# end

# ['default', 'Директор', 'Заместитель Директора', 'Начальник отдела', 'Инженер'].each_with_index do |d, i|
#   Department.create(name: d, lock: false, sort_level: i)
# end

Role.all.each do |role|
  User.create(
    role: role,
    position: Position.default,
    department: Department.default,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.middle_name,
    login: "#{role.name}",
    password: 'password')
end
