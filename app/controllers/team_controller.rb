# frozen_string_literal: true

class TeamController < ApplicationController
  def index
    paginate_result(Team.all.map { |team| TeamSerializer.new(team).serializable_hash })
  end

  def show
    render json: TeamSerializer.new(Team.find(team_id_param[:id]), params: { team: true }).serializable_hash
  end

  private

  def team_id_param
    params.permit(:id)
  end
end
