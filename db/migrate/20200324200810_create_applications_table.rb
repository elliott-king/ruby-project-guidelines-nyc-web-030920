class CreateApplicationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :position_id 
      t.integer :candidate_id 
    end
    
  end
end
