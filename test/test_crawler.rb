gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/crawler'

module Ecco
  class CrawlerTest < Minitest::Test
    def test_le_monde
      crawler = Crawler.new(:lemonde)
      site_data = crawler.get_data

      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
    end
  end
end