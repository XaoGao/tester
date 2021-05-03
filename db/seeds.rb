require 'faker'

# %w[doctor patient hr registrar admin].each do |role|
#   Role.create(name: role)
# end

# ['default', 'Администрация', 'Отдел кадров', 'Бухгалтерия', 'Системное программирования'].each do |p|
#   Position.create(name: p, lock: false)
# end

# Role.all.each do |role|
#   User.create(
#     role: role,
#     position: Position.default,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     middle_name: Faker::Name.middle_name,
#     login: "#{role.name}",
#     password: 'password')
# end
