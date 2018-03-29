class Api::V1::TargetGroupsController < Api::BaseController

  api :GET, '/target_groups/:country_code'
  param :country_code, String, desc: 'Country code for filtering', required: true

  def index
    @root_target_groups = TargetGroup.roots.where(
      panel_provider_id: current_provider.id,
      country_ids: current_country.id
    )
  end
end
