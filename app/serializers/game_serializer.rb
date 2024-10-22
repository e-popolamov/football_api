# frozen_string_literal: true

class GameSerializer
  include JSONAPI::Serializer

  attributes :id, :date, :result, :coefficient, :win_team_id, :second_team_id

  def serializable_hash
    s_hash = super
    return if s_hash[:data].blank?

    attributes = s_hash[:data][:attributes]
    {
      id: attributes[:id].to_i,
      date: attributes[:date].strftime("%Y-%m-%d"),
      win_team_id: attributes[:win_team_id],
      win_team_name: @resource.win_team.name,
      second_team_id: attributes[:second_team_id],
      second_team_name: @resource.second_team.name,
      score: attributes[:result],
      coefficient: attributes[:coefficient]
    }
  end
end
