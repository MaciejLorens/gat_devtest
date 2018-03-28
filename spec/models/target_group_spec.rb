require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  it 'has_many countries' do
    target_group = create(:target_group)
    country_1 = create(:country, target_groups: [target_group])
    country_2 = create(:country, target_groups: [target_group])

    expect(target_group.countries).to match_array([country_1, country_2])
  end

  it 'belongs_to panel_provider' do
    panel_provider = create(:panel_provider)
    target_group = create(:target_group, panel_provider: panel_provider)

    expect(target_group.panel_provider).to eq(panel_provider)
  end

  context 'self referencing association' do
    it 'has_many target_groups as childs' do
      root = create(:target_group)
      child_1 = create(:target_group, parent: root)
      child_2 = create(:target_group, parent: root)
      child_3 = create(:target_group, parent: root)
      child_3_1 = create(:target_group, parent: child_3)
      child_3_2 = create(:target_group, parent: child_3)
      child_3_2_1 = create(:target_group, parent: child_3_2)

      expect(root.child_target_groups.count).to eq(3)
      expect(child_1.child_target_groups.count).to eq(0)
      expect(child_2.child_target_groups.count).to eq(0)
      expect(child_3.child_target_groups.count).to eq(2)
      expect(child_3_1.child_target_groups.count).to eq(0)
      expect(child_3_2.child_target_groups.count).to eq(1)
      expect(child_3_2_1.child_target_groups.count).to eq(0)
    end

    it 'belongs_to target_groups as parent' do
      root = create(:target_group)
      child_1 = create(:target_group, parent: root)

      expect(child_1.parent).to eq(root)
    end
  end
end
