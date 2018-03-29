class Api::V1::EvaluateTargetController < Api::BaseController

  protect_from_forgery with: :null_session

  api :POST, '/evaluate_target'
  param :country_code, String, desc: 'Country code for filtering', required: true
  param :target_group_id, String, desc: 'Id of the TargetGroup', required: true
  param :locations, Array, desc: 'Locations params array', required: true

  def price
    price = PriceStrategies.new(current_provider).fetch_price
    render json: { price: price }, status: 200
  end

end
