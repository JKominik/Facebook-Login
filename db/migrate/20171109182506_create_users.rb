class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :token
      t.string :fb_id

      t.timestamps
    end
    add_index :users, :fb_id, unique: true
  end
end
