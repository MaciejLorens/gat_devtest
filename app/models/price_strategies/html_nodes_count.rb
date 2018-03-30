class PriceStrategies::HtmlNodesCount

  URL = 'http://time.com/'.freeze
  HTML_NODE_REGEX =
    /<([a-z]+)(?=[\s>])(?:[^>=]|='[^']*'|="[^"]*"|=[^'"\s]*)*\s?\/?>/

  def self.fetch_price
    html = Nokogiri::HTML(open(URL))
    html_string = html.to_s
    count_nodes(html_string)
  end

  def self.count_nodes(html)
    html.scan(HTML_NODE_REGEX).count
  end
end
