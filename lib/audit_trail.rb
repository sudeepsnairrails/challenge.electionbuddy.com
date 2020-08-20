module Audit_trail
    def audit
        changes = []
        attributes.keys.each do |key|
          if key!= "updated_at" && eval("#{key}_changed?")
          temp_hash = {}
          temp_hash[:field_name] = key
          temp_hash[:old_value] = eval("#{key}_change")[0]
          temp_hash[:new_value] = eval("#{key}_change")[1]
          changes.push(temp_hash)
          end
        end
        create_audit(changes)
      end
    
      def create_audit(array_of_changes)
        array_of_changes.each do |a|
            audit_record = Audit.new
            audit_record.entity = self.class
            audit_record.entity_id = self.id
            case self.class.to_s
            when "Election"
              audit_record.election = self
              audit_record.user = self.user
            when "Question"
              audit_record.election = self.election
              audit_record.user = self.election.user
            when "Answer"
              audit_record.election = self.question.election
              audit_record.user = self.question.election.user
            when "Voter"
              audit_record.election = self.election
              audit_record.user = self.election.user
            end
            audit_record.field = a[:field_name]
            audit_record.old_value = a[:old_value]
            audit_record.new_value = a[:new_value]
            audit_record.save
        end
      end
end