require 'rails_helper'

RSpec.describe PriceStrategies::ArraysCount, type: :model do
  let (:json) do
    {
      "start" => 0,
      "num_found" => 484,
      "numFound" => 484,
      "docs" => [
        {
          "title_suggest" => "The Lord of the Rings",
          "edition_key" => [
            "OL7261843M",
            "OL8610134M",
            "OL7852726M",
            "OL7851256M",
            "OL22510662M",
            "OL7852725M",
            "OL10236419M",
            "OL21485714M",
            "OL9559516M",
            "OL7603320M",
            "OL24278639M",
            "OL24261347M"
          ],
          "cover_i" => 8069767,
          "isbn" => [
            "8020409262",
            "0261103407",
            "9781565116696",
            "9780563536574",
            "type" => "work",
            "ebook_count_i" => 0,
            "edition_count" => 1,
            "key" => "/works/OL3130523W",
            "id_goodreads" => [
              "998542"
            ],
            "publisher" => [
              "Running Press Book Publishers",
              "1" => [
                "11" => [
                  "111" => [
                    "something_4",
                    "something_5",
                    "something_6",
                    "something_7",
                    "something_8",
                  ]
                ]
              ]
            ],
            "language" => [
              "en",
              "de",
              "pl",
              "ru"
            ],
            "last_modified_i" => 1304059545,
            "id_librarything" => [
              "3309205",
              "3309205",
              "3309205",
              "3309205",
              "3309205",
              "3309205",
            ],
            "cover_edition_key" => "OL8033048M",
            "publish_year" => [
              2002
            ],
            "first_publish_year" => 2002
          ]
        }
      ]
    }
  end

  before do
    stub_const("PriceStrategies::ArraysCount::COUNT_TRIGGER", 4)
  end

  it 'counts arrays with enouth elements' do
    price = PriceStrategies::ArraysCount.count_arrays(json)

    expect(price).to eq(5)
  end
end
