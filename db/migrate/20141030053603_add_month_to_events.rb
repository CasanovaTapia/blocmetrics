class AddMonthToEvents < ActiveRecord::Migration
  def change
    add_column :events, :month, :integer
    add_index :events, :month
  end
end
