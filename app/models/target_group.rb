class TargetGroup
  include Mongoid::Document

  field :name, type: String
  field :external_id, type: String
  field :parent_id, type: String
  field :secret_code, type: String

  has_and_belongs_to_many :countries
  has_many :child_target_groups, class_name: 'TargetGroup'
  belongs_to :parent, class_name: 'TargetGroup'
  belongs_to :panel_provider

  index({countrie_ids: 1})
  index({parent_id: 1})
  index({panel_provider_id: 1})

  accepts_nested_attributes_for :child_target_groups

  scope :roots, -> { where(parent_id: nil) }

end
