class CreateGameStatRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :game_stat_records do |t|
      t.belongs_to :game_stat, null: false, foreign_key: true
      t.belongs_to :coefficient, null: false, foreign_key: true
      t.float :value, null: true

      t.timestamps
    end
  end
end
