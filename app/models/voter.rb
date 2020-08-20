class Voter < ApplicationRecord
  include Audit_trail
  belongs_to :election
  before_update :audit
end
