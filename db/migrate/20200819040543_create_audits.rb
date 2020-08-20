class CreateAudits < ActiveRecord::Migration[6.0]
  def change
    create_table :audits do |t|
      t.string :entity
      t.integer :entity_id
      t.string :field
      t.string :old_value
      t.string :new_value
      t.references :user, foreign_key: true
      t.references :election, foreign_key: true
      t.timestamps
    end
  end
end

