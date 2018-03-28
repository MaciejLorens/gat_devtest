require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'has_many location_groups' do
    country = create(:country)
    location_group_1 = create(:location_group, country: country)
    location_group_2 = create(:location_group, country: country)

    expect(country.location_groups)
      .to match_array([location_group_1, location_group_2])
  end

  it 'has_many target_groups' do
    country = create(:country)
    target_group_1 = create(:target_group, countries: [country])
    target_group_2 = create(:target_group, countries: [country])

    expect(country.target_groups)
      .to match_array([target_group_1, target_group_2])
  end

  it 'belongs_to panel_provider' do
    panel_provider = create(:panel_provider)
    country = create(:country, panel_provider: panel_provider)

    expect(country.panel_provider).to eq(panel_provider)
  end
end
