class AddSubmittedColumnToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :submitted, :boolean, :defalut => false
  end
end
