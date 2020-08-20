class Question < ApplicationRecord
  include Audit_trail
  belongs_to :election
  has_many :answers
  before_update :audit
end
