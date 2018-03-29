class PanelProvider
  include Mongoid::Document

  field :code, type: String
  field :price_strategy, type: String

  has_many :countries
  has_many :location_groups
  has_many :target_groups

end
