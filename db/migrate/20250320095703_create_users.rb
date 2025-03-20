class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 20
      t.string :email, null: false, limit: 20
      t.string :phone, null: false, limit: 20
      t.text :address, null: false
      t.text :password_hash, null: false 
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
