class ChangePositionTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :positions, :type, :position_type
  end
end
