class Api::V1::LocationsController < Api::BaseController

  api :GET, '/locations/:country_code'
  param :country_code, String, desc: 'Country code for filtering', required: true

  def index
    location_groups = LocationGroup.where(
      country_id: current_country.id,
      panel_provider_id: current_provider.id
    )

    @locations = location_groups.map(&:locations).flatten
  end
end
