class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :autor
      t.text :mensaje
      t.integer :monto
      t.integer :campaign_id

      t.timestamps
    end
  end
end
