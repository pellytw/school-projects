class CreateLocalities < ActiveRecord::Migration[7.2]
  def change
    create_table :localities do |t|
      t.string :name, null: false
      t.string :province, null: false

      t.timestamps
    end
  end
end
