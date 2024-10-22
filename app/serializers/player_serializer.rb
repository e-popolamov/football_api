# frozen_string_literal: true

class PlayerSerializer
  include JSONAPI::Serializer

  attributes :id, :first_name, :last_name

  def serializable_hash
    s_hash = super
    return if s_hash[:data].blank?

    attributes = s_hash[:data][:attributes]
    {
      id: attributes[:id].to_i,
      first_name: attributes[:first_name],
      last_name: attributes[:last_name],
      team_id: @resource.team.id,
      team_name: @resource.team.name,
      role_id: @resource.role.id,
      role_name: @resource.role.name
    }
  end
end
