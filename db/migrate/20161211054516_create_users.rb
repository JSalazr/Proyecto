class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.text :password_digest
      t.text :ciudad
      t.text :pais
      t.boolean :receive_email

      t.timestamps


    end
  end
end
