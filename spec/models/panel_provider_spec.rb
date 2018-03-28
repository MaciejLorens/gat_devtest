require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  it 'has_many countries' do
    panel_provider = create(:panel_provider)
    country_1 = create(:country, panel_provider: panel_provider)
    country_2 = create(:country, panel_provider: panel_provider)

    expect(panel_provider.countries).to match_array([country_1, country_2])
  end

  it 'has_many location_groups' do
    panel_provider = create(:panel_provider)
    location_group_1 = create(:location_group, panel_provider: panel_provider)
    location_group_2 = create(:location_group, panel_provider: panel_provider)

    expect(panel_provider.location_groups)
      .to match_array([location_group_1, location_group_2])
  end

  it 'has_many target_groups' do
    panel_provider = create(:panel_provider)
    target_group_1 = create(:target_group, panel_provider: panel_provider)
    target_group_2 = create(:target_group, panel_provider: panel_provider)

    expect(panel_provider.target_groups)
      .to match_array([target_group_1, target_group_2])
  end
end
