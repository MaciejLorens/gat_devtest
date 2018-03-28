require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'has many location_groups' do
    country = create(:country)
    lg1 = create(:location_group, country: country)
    lg2 = create(:location_group, country: country)

    expect(country.location_groups.count).to eq(2)
    expect(lg1.country).to eq(country)
    expect(lg2.country).to eq(country)
  end
end
