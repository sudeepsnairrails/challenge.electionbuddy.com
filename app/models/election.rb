class Election < ApplicationRecord
  include Audit_trail
  has_many :questions
  has_many :audits
  belongs_to :user
  serialize :settings, Hash
  before_update :audit

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end
end



 