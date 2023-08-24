class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

  def show
    client = Client.find(params[:id])
    render json: client, methods: :total_charges, status: :ok
  end

  private

  def render_invalid_response
    render json: { error: "Record not found" }, status: :not_found
  end

end
