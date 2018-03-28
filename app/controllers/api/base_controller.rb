class Api::BaseController < ApplicationController

  before_action :authorize!

  rescue_from Apipie::ParamMissing, with: :unprocessable_entity
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  private

  def current_provider
    @current_provider
  end

  def authorize!
    authenticate_or_request_with_http_token do |token, _|
      @current_provider = PanelProvider.find_by(code: token)
    end
  end

  def unprocessable_entity(exception)
    render json: { error: exception.to_s }, status: 422
  end

  def not_found
    render json: { error: 'Resource not found' }, status: 404
  end
end
