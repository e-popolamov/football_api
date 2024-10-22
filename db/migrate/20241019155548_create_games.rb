class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.datetime :date, null: false
      t.string :result, null: false
      t.float :coefficient, null: false

      t.belongs_to :win_team, null: false, foreign_key: { to_table: :teams }
      t.belongs_to :second_team, null: false, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
