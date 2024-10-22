# frozen_string_literal: true

class GameStatRecord < ApplicationRecord
  belongs_to :game_stat
  belongs_to :coefficient
end
