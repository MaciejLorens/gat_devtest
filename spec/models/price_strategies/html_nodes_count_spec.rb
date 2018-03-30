require 'rails_helper'

RSpec.describe PriceStrategies::HtmlNodesCount, type: :model do
  let (:html) do
    '
      <html>
      <head><title>abc</title>
      <body class="home">
        <div class="print-mode"></div>
        <div id="nativo-trigger"></div>
        <div id="fb-root"></div>
        <article><div><span>smaple</span></div></article>
        <script>var s_account = "timecom";</script>
        <script defer src="time_s_code_multivideo.js"></script>
        <div class="pushdowns">
          <div id="pushdown-ad"></div>
        </div>
        <header class="main-header" role="banner">
          <div class="left-rail-header" role="banner">
            <a class="time-icons-menu" title="Click"></a>
            <div class="logo-wrap">
              <a itemprop="url" href="http://time.com/" class="logo"></a>
            </div>
          </div>
        </header>
      </body>
      </html>
    '
  end

  it 'counts html nodes' do
    price = PriceStrategies::HtmlNodesCount.count_nodes(html)
    expect(price).to eq(19)
  end
end
