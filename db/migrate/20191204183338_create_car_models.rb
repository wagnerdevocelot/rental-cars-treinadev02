class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.integer :year
      t.string :fuel_type
      t.references :manufacturer, foreign_key: true
      t.string :motorization

      t.timestamps
    end
  end
end
