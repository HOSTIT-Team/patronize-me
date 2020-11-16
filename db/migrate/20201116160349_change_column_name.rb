class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :deadline, :day
  end
end
