#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/comparison'

# Not listed on the site
SKIP = [
  ['---', 'Q48136013', 'Mario Abdo Benítez', 'Presidente de Paraguay' ],
  ['---', 'Q52138237', 'Hugo Velázquez Moreno', 'Vicepresidente del Paraguay' ],
].freeze

diff = EveryPoliticianScraper::NulllessComparison.new('wikidata.csv', 'scraped.csv').diff
                                                 .reject { |row| SKIP.include? row }

puts diff.sort_by { |r| [r.first, r[1].to_s] }.reverse.map(&:to_csv)
