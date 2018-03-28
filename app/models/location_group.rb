class LocationGroup
  include Mongoid::Document

  field :name, type: String

  has_and_belongs_to_many :locations
  belongs_to :country
  belongs_to :panel_provider

  index({location_ids: 1})
  index({country_id: 1})
  index({panel_provider_id: 1})
  index({country_id: 1, panel_provider_id: 1})

end
