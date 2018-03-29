class Api::V1::TargetGroupsController < Api::BaseController

  api :GET, '/target_groups/:country_code'
  param :country_code, String, desc: 'Country code for filtering', required: true

  def index
    country = Country.find_by(country_code: params[:country_code])

    @root_target_groups = TargetGroup.roots.where(
      panel_provider_id: current_provider.id,
      country_ids: country.id
    )
  end
end
