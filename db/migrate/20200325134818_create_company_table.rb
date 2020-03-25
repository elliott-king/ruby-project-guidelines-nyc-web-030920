class CreateCompanyTable < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      # TODO: consider adding 'location?'
      t.string :company_logo
    end
  end
end
