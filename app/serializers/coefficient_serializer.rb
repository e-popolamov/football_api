# frozen_string_literal: true

class CoefficientSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :value

  def serializable_hash
    s_hash = super
    return if s_hash[:data].blank?

    attributes = s_hash[:data][:attributes]
    {
      id: attributes[:id].to_i,
      name: attributes[:name],
      value: attributes[:value]
    }
  end
end
