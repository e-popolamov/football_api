# frozen_string_literal: true

class RoleController < ApplicationController
  def index
    render json: Role.all.map { |role| RoleSerializer.new(role).serializable_hash }
  end

  def show
    render json: RoleSerializer.new(Role.find(role_id_param[:id])).serializable_hash
  end

  private

  def role_id_param
    params.permit(:id)
  end
end
