class Country
  include Mongoid::Document

  field :country_code, type: String

  has_many :location_groups
  has_and_belongs_to_many :target_groups
  belongs_to :panel_provider

  index({target_group_ids: 1})
  index({panel_provider_id: 1})

end
