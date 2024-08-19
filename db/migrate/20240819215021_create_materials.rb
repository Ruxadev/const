class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :store
      t.decimal :estimated_value
      t.decimal :paid_value
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
