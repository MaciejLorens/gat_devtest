require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'has_many location_groups' do
    location = create(:location)
    location_group_1 = create(:location_group, locations: [location])
    location_group_2 = create(:location_group, locations: [location])

    expect(location.location_groups)
      .to match_array([location_group_1, location_group_2])
  end
end
