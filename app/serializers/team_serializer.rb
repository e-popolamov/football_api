# frozen_string_literal: true

class TeamSerializer
  include JSONAPI::Serializer

  attributes :id, :name
  has_many :players, meta: proc { |team, _params|
    team.players.includes(:role).map { |player| PlayerSerializer.new(player).serializable_hash }
  }, serializer: PlayerSerializer

  def serializable_hash
    s_hash = super
    return if s_hash[:data].blank?

    attributes = s_hash[:data][:attributes]
    result = {
      id: attributes[:id].to_i,
      name: attributes[:name]
    }
    result.merge!({ players: s_hash[:data][:relationships][:players][:meta] }) if @params[:team]

    result
  end
end
