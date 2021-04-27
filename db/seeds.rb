%w[doctor patient hr registrar admin].each do |role|
  Role.create(name: role)
end
