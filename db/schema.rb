# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_19_155912) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coefficients", force: :cascade do |t|
    t.string "name", null: false
    t.float "value", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_coefficients_on_role_id"
  end

  create_table "game_stat_records", force: :cascade do |t|
    t.bigint "game_stat_id", null: false
    t.bigint "coefficient_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coefficient_id"], name: "index_game_stat_records_on_coefficient_id"
    t.index ["game_stat_id"], name: "index_game_stat_records_on_game_stat_id"
  end

  create_table "game_stats", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_stats_on_game_id"
    t.index ["player_id"], name: "index_game_stats_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date", null: false
    t.string "result", null: false
    t.float "coefficient", null: false
    t.bigint "win_team_id", null: false
    t.bigint "second_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["second_team_id"], name: "index_games_on_second_team_id"
    t.index ["win_team_id"], name: "index_games_on_win_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "team_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_players_on_role_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coefficients", "roles"
  add_foreign_key "game_stat_records", "coefficients"
  add_foreign_key "game_stat_records", "game_stats"
  add_foreign_key "game_stats", "games"
  add_foreign_key "game_stats", "players"
  add_foreign_key "games", "teams", column: "second_team_id"
  add_foreign_key "games", "teams", column: "win_team_id"
  add_foreign_key "players", "roles"
  add_foreign_key "players", "teams"
end
