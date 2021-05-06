class PhoneSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :number
end
