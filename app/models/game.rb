# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :win_team, class_name: "Team", optional: true
  belongs_to :second_team, class_name: "Team", optional: true
  has_many :win_team_game_stat, ->(game) { where(player_id: game.win_team.players.ids) }, class_name: "GameStat",
           foreign_key: "game_id",  dependent: :destroy

  has_many :second_team_game_stat, ->(game) { where(player_id: game.second_team.players.ids) }, class_name: "GameStat",
           foreign_key: "game_id",  dependent: :destroy

  has_many :stats, class_name: "GameStat", dependent: :destroy
end
