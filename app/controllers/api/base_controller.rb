class Api::BaseController < ApplicationController

  before_action :authorize!, :set_current_country

  rescue_from Apipie::ParamMissing, with: :unprocessable_entity
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  private

  def current_provider
    @current_provider
  end

  def current_country
    @current_country
  end

  def authorize!
    authenticate_or_request_with_http_token do |token, _|
      @current_provider = PanelProvider.find_by(code: token)
    end
  end

  def set_current_country
    return unprocessable_entity('Missing param: country_code') unless params[:country_code]
    @current_country = Country.find_by(country_code: params[:country_code])
  end

  def unprocessable_entity(exception)
    render json: { error: exception.to_s }, status: 422
  end

  def not_found
    render json: { error: 'Resource not found' }, status: 404
  end
end
