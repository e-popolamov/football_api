# frozen_string_literal: true

class CoefficientController < ApplicationController
  def index
    render json: Role.find(role_id_param[:id]).coefficients
                     .map { |coefficient| CoefficientSerializer.new(coefficient).serializable_hash }
  end

  private

  def role_id_param
    params.require(:role).permit(:id)
  end
end
