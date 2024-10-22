# frozen_string_literal: true

class StatResult
  attr_reader :game
  BASE_ROUNDS = 2

  def initialize(game_id)
    raise ArgumentError, "game_id is required" if game_id.blank?

    @game = Game.find(game_id)
  end

  def call
    NotImplementedError
  end
end
