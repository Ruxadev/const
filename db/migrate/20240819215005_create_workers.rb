class CreateWorkers < ActiveRecord::Migration[7.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :position
      t.string :phone_number
      t.decimal :estimated_labor_value
      t.decimal :paid_value
      t.decimal :construction_material_value
      t.integer :worked_hours
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
