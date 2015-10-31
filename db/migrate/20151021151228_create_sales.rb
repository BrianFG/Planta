class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :cantidad
      t.float :precio
      t.float :envio
      t.time :hora
      t.references :container
      t.references :day
      t.timestamps null: false
    end
  end
end
