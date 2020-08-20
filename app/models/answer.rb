class Answer < ApplicationRecord
  include Audit_trail
  belongs_to :question
  before_update :audit
end
