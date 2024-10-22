# frozen_string_literal: true

class GameController < ApplicationController
  def index
    paginate_result(Game.all.map { |game| GameSerializer.new(game).serializable_hash })
  end

  def show
    render json: GameSerializer.new(Game.find(game_id_param[:id])).serializable_hash
  end

  private

  def game_id_param
    params.permit(:id)
  end
end
