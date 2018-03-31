require 'open-uri'

class PriceStrategies::ArraysCount

  URL = 'http://openlibrary.org/search.json?q=the+lord+of+the+rings'.freeze
  COUNT_TRIGGER = 10.freeze

  def self.fetch_price
    response = open(URL).read
    json = JSON.parse(response)

    count_arrays(json)
  end

  def self.count_arrays(json)
    return 0 unless json.is_a?(Hash)

    json.values.map do |value|
      adding = 0

      if value.is_a?(Array)
        adding += 1 if value.count >= COUNT_TRIGGER
        adding += value.map{|v| count_arrays(v)}.sum
      end

      adding
    end.sum
  end
end
