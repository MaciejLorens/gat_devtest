require 'open-uri'

class PriceStrategies::ArraysCount

  @@count = 0

  COUNT_TRIGGER = 10.freeze

  def self.fetch_price
    url = 'http://openlibrary.org/search.json?q=the+lord+of+the+rings'
    response = open(url).read
    json = JSON.parse(response)

    count_arrays(json, COUNT_TRIGGER)
  end

  def self.count_arrays(json, count_trigger)
    return until json.is_a? Hash

    json.keys.each do |key|
      if json[key].is_a? Array
        if json[key].count >= count_trigger
          @@count += 1
        end

        json[key].map do |json|
          self.count_arrays(json, count_trigger)
        end
      end
    end

    @@count
  end
end
