class CreateSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :code
      t.string :address
      t.string :level, null: false
      t.references :locality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
