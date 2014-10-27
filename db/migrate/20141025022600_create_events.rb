class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :ip_address
      t.string :web_property_id
      t.references :user, index: true
      t.references :app, index: true
      t.datetime :created_at

      t.timestamps
    end
  end
end
