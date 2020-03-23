class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :api_id
      t.string :type 
      t.string :url 
      t.datetime :created_at 
      t.string :company 
      t.string :company_url
      t.string :location
      t.string :title 
      t.string :description
      t.string :how_to_apply
      t.string :company_logo
    end
  end
end
