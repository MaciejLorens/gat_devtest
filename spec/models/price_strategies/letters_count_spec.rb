require 'rails_helper'

RSpec.describe PriceStrategies::LettersCount, type: :model do
  let (:html) do
    '
      <html>
      <head><title>b_a_c</title>
      <body class="home">
        <div class="print-mode">b_aa_c</div>
        <div id="nativo-trigger">_A_</div>
        <div id="fb-root"></div>
        <article><div><span>sm_a_ple</span></div></article>
        <script>var s_account = "timecom";</script>
        <script defer src="time_s_code_multivideo.js"></script>
        <div class="pushdowns">
          <div id="pushdown-ad">yhtr45343_a_</div>
        </div>
        <header class="main-header" role="banner">
          <div class="left-rail-header" role="banner">
            aaaa
            <a class="time-icons-menu" title="Click"></a>
            <div class="logo-wrap">
              <a itemprop="url" href="http://time.com/" class="logo">Ac_a_v</a>
            </div>
          </div>
        </header>
      </body>
      </html>
    '
  end

  it 'counts html nodes' do
    price = PriceStrategies::LettersCount.count_chars(html)
    expect(price).to eq(10)
  end
end
