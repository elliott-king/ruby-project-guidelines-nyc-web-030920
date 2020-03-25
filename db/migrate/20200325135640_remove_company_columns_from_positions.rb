class RemoveCompanyColumnsFromPositions < ActiveRecord::Migration[5.0]
  def change
    remove_columns(:positions, :company, :company_url, :company_logo)
  end
end
