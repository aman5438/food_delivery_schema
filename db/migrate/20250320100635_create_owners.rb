class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :name, null: false, limit: 20
      t.string :email, null: false, limit: 30
      t.string :phone, null: false, limit: 30
      t.text :password_hash

      t.timestamps
    end

    add_index :owners, :email, unique: true
    add_index :owners, :phone, unique: true
  end
end
