class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.text :titulo
      t.text :description
      t.text :resena
      t.integer :meta
      t.string :category
      t.text :image
      t.integer :user_id
      t.integer :cant_like
      t.date :finalizado_en

      t.timestamps
    end
  end
end
