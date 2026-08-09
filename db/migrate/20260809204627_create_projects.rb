class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.string :category, null: false, default: "institutional"
      t.string :status, null: false, default: "draft"
      t.date :starts_on
      t.date :ends_on
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
