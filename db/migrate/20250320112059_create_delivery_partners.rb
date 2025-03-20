class CreateDeliveryPartners < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_partners do |t|
      t.string :name, null: false, limit: 20
      t.string :phone, null: false, limit: 20
      t.string :vechile_number, null: false, limit: 20
      t.text :location, null: false
      t.column :status, :string, default: "available"

      t.timestamps
    end
  end
end
