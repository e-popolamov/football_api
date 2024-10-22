# frozen_string_literal: true

class StatSerializer
  include JSONAPI::Serializer

  attributes :value

  has_one :game, meta: proc { |stat, _params|
    GameSerializer.new(stat.game).serializable_hash
  }, serializer: GameSerializer

  has_one :player, meta: proc { |stat, _params|
    PlayerSerializer.new(stat.player).serializable_hash
  }, serializer: PlayerSerializer


  def serializable_hash
    s_hash = super
    return if s_hash[:data].blank?

    attributes = s_hash[:data][:attributes]
    result = {
      player: s_hash[:data][:relationships][:player][:meta],
      game: s_hash[:data][:relationships][:game][:meta],
      value: attributes[:value]
    }

    result
  end
end