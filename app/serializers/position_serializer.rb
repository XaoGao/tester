class PositionSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower

  attributes :name
end
