class AddUserKeyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_key, :string
  end
end
