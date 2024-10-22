class CreateCoefficients < ActiveRecord::Migration[7.2]
  def change
    create_table :coefficients do |t|
      t.string :name, null: false
      t.float :value, null: false
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
