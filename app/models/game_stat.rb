# frozen_string_literal: true

class GameStat < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :records, class_name: "GameStatRecord", dependent: :destroy

  validates :player_id, uniqueness: { scope: :game_id }
end
