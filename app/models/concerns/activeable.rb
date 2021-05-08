module Activeable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(lock: false)}
    scope :desable, -> { where(lock: true) }
  end
end
