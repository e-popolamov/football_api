# frozen_string_literal: true

class StatController < ApplicationController
  def index
    paginate_result(StatFinder.new(**filter_params.to_h.symbolize_keys).call
                              .map { |s| StatSerializer.new(s).serializable_hash })
  end

  private

  def filter_params
    params.permit(:team_id, :date_from, :date_to, :role_id, :order, :limit)
  end
end
