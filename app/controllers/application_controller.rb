# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :record_not_found

  def paginate_result(collection)
    pages = Kaminari.paginate_array(collection).page(params[:page] || 1).per(params[:per_page] || 10)
    render json: pagination_meta(pages)
  end

  def page_params
    params.permit(:per_page, :page)
  end

  private

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end

  def pagination_meta(pages)
    {
      meta: {
        total_pages: pages.total_pages,
        current_page: pages.current_page,
        total_count: pages.total_count
      },
      data: pages
    }
  end
end
