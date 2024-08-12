class CreateEquipaments < ActiveRecord::Migration[7.1]
  def change
    create_table :equipaments do |t|
      t.string :name, null: false
      t.string :serial_number, null: false

      t.timestamps
    end
  end
end
