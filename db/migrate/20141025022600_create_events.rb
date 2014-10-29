class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :ip_address
      t.string :property_1
      t.string :property_2
      t.references :user, index: true
      t.datetime :created_at

      t.timestamps
    end
  end
end
