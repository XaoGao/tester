module Workable
  extend ActiveSupport::Concern
  included do
    has_many :users

    scope :all_except_default, -> { where.not(name: 'default') }

    def self.default
      default_department = find_by(name: 'default')
      create!(name: 'default', lock: false, sort_level: 0) if default_department.blank?
      find_by(name: 'default')
    end
  end
end
