require 'rails_helper'

RSpec.describe LocationGroup, type: :model do
  it 'belongs_to country' do
    country = create(:country)
    location_group = create(:location_group, country: country)

    expect(location_group.country).to eq(country)
  end

  it 'belongs_to panel_provider' do
    panel_provider = create(:panel_provider)
    location_group = create(:location_group, panel_provider: panel_provider)

    expect(location_group.panel_provider).to eq(panel_provider)
  end

  it 'has_many locations' do
    location_group = create(:location_group)
    location_1 = create(:location, location_groups: [location_group])
    location_2 = create(:location, location_groups: [location_group])

    expect(location_group.locations)
      .to match_array([location_1, location_2])
  end
end
