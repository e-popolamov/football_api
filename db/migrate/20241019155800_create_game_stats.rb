class CreateGameStats < ActiveRecord::Migration[7.2]
  def change
    create_table :game_stats do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true
      t.float :value, null: true

      t.timestamps
    end
  end
end
