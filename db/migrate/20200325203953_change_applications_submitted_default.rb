class ChangeApplicationsSubmittedDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :applications, :submitted, :boolean, :default => false
  end
end
