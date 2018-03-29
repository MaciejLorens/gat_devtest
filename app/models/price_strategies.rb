class PriceStrategies

  attr_accessor :panel_provider

  def initialize(panel_provider)
    self.panel_provider = panel_provider
  end

  def fetch_price
    strategy.fetch_price
  end

  private

  def strategy
    "PriceStrategies::#{panel_provider.price_strategy}".constantize
  end

end
