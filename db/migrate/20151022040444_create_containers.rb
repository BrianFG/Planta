class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :nombre
      t.float :litros

      t.timestamps null: false
    end
  end
end
