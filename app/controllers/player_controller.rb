# frozen_string_literal: true

class PlayerController < ApplicationController
  def show
    render json: PlayerSerializer.new(Player.find(player_id_param[:id])).serializable_hash
  end

  private

  def player_id_param
    params.permit(:id)
  end
end
