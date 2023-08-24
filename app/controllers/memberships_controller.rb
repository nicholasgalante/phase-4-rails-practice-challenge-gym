class MembershipsController < ApplicationController
  rescue_from ActiveRecord:RecordInvalid, with: :render_invalid_response

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
  end

  private

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def render_invalid_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
