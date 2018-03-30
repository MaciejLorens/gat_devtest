require 'open-uri'
require 'sanitize'

class PriceStrategies::LettersCount

  URL = 'http://time.com/'.freeze
  SCRIPT_REGEX = /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/i
  NO_SCRIPT_REGEX = /<noscript\b[^<]*(?:(?!<\/noscript>)<[^<]*)*<\/noscript>/i
  WHITE_CHAR_REGEX = /\s+/
  PRICE_COUNT_CHAR = 'a'

  def self.fetch_price
    html = Nokogiri::HTML(open(URL))
    body_string = html.css('body').first.to_s
    count_chars(body_string)
  end

  def self.count_chars(html_string)
    escaped_body = escape(html_string)
    sanitized_body = Sanitize.fragment(escaped_body, Sanitize::Config::RESTRICTED)
    sanitized_body.count(PRICE_COUNT_CHAR)
  end

  private

  def self.escape(text)
    text
      .gsub(SCRIPT_REGEX, '')
      .gsub(NO_SCRIPT_REGEX, '')
      .gsub(WHITE_CHAR_REGEX, '')
  end
end
