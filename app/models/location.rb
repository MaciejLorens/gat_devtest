class Location
  include Mongoid::Document

  field :name, type: String
  field :external_id, type: String
  field :secret_code, type: String

  has_and_belongs_to_many :location_groups

  index({location_group_ids: 1})

end
