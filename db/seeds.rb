PanelProvider.delete_all
Country.delete_all
Location.delete_all
LocationGroup.delete_all
TargetGroup.delete_all

panel_provider_1 = PanelProvider.create(
  code: "panel-provider-code-#{SecureRandom.hex(5)}"
)
panel_provider_2 = PanelProvider.create(
  code: "panel-provider-code-#{SecureRandom.hex(5)}"
)
panel_provider_3 = PanelProvider.create(
  code: "panel-provider-code-#{SecureRandom.hex(5)}"
)

country_1 = Country.create(
  country_code: Faker::Address.country_code,
  panel_provider: panel_provider_1
)
country_2 = Country.create(
  country_code: Faker::Address.country_code,
  panel_provider: panel_provider_2
)
country_3 = Country.create(
  country_code: Faker::Address.country_code,
  panel_provider: panel_provider_3
)

LocationGroup.create(
  [
    {
      name: "location-group-name-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_1,
      country: country_1
    },
    {
      name: "location-group-name-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      country: country_2
    },
    {
      name: "location-group-name-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_3,
      country: country_1
    },
    {
      name: "location-group-name-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      country: country_3
    }
  ]
)

20.times do
  location = Location.create(
    name: "location-name-#{SecureRandom.hex(5)}",
    external_id: "location-external-id-#{SecureRandom.hex(5)}",
    secret_code: "location-secret-code-#{SecureRandom.hex(5)}",
  )

  location.location_groups << LocationGroup.all.sample
end

TargetGroup.create(
  name: "target-group-name-#{SecureRandom.hex(5)}",
  external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
  parent_id: nil,
  secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
  panel_provider: panel_provider_1,
  countries: [country_1],
  child_target_groups: [
    TargetGroup.create(
      name: "target-group-name-#{SecureRandom.hex(5)}",
      external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
      secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      child_target_groups: [
        TargetGroup.create(
          name: "target-group-name-#{SecureRandom.hex(5)}",
          external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
          secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
          panel_provider: panel_provider_3,
          child_target_groups: [
            TargetGroup.create(
              name: "target-group-name-#{SecureRandom.hex(5)}",
              external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
              secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
              panel_provider: panel_provider_1
            )
          ]
        )
      ]
    )
  ]
)

TargetGroup.create(
  name: "target-group-name-#{SecureRandom.hex(5)}",
  external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
  parent_id: nil,
  secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
  panel_provider: panel_provider_1,
  countries: [country_2],
  child_target_groups: [
    TargetGroup.create(
      name: "target-group-name-#{SecureRandom.hex(5)}",
      external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
      secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      child_target_groups: [
        TargetGroup.create(
          name: "target-group-name-#{SecureRandom.hex(5)}",
          external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
          secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
          panel_provider: panel_provider_3,
          child_target_groups: [
            TargetGroup.create(
              name: "target-group-name-#{SecureRandom.hex(5)}",
              external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
              secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
              panel_provider: panel_provider_2
            )
          ]
        )
      ]
    )
  ]
)

TargetGroup.create(
  name: "target-group-name-#{SecureRandom.hex(5)}",
  external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
  parent_id: nil,
  secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
  panel_provider: panel_provider_1,
  countries: [country_3],
  child_target_groups: [
    TargetGroup.create(
      name: "target-group-name-#{SecureRandom.hex(5)}",
      external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
      secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      child_target_groups: [
        TargetGroup.create(
          name: "target-group-name-#{SecureRandom.hex(5)}",
          external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
          secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
          panel_provider: panel_provider_3,
          child_target_groups: [
            TargetGroup.create(
              name: "target-group-name-#{SecureRandom.hex(5)}",
              external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
              secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
              panel_provider: panel_provider_3
            )
          ]
        )
      ]
    )
  ]
)

TargetGroup.create(
  name: "target-group-name-#{SecureRandom.hex(5)}",
  external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
  parent_id: nil,
  secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
  panel_provider: panel_provider_1,
  countries: [country_2],
  child_target_groups: [
    TargetGroup.create(
      name: "target-group-name-#{SecureRandom.hex(5)}",
      external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
      secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
      panel_provider: panel_provider_2,
      child_target_groups: [
        TargetGroup.create(
          name: "target-group-name-#{SecureRandom.hex(5)}",
          external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
          secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
          panel_provider: panel_provider_3,
          child_target_groups: [
            TargetGroup.create(
              name: "target-group-name-#{SecureRandom.hex(5)}",
              external_id: "target-group-external-id-#{SecureRandom.hex(5)}",
              secret_code: "target-group-secret-code-#{SecureRandom.hex(5)}",
              panel_provider: panel_provider_2
            )
          ]
        )
      ]
    )
  ]
)
