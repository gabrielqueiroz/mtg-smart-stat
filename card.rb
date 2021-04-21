require './default_stats'
require 'net/http'
require 'json'

class Card
  attr_accessor :name, :raw_data, :stats

  def initialize(name: nil, raw_data: nil)
    @name = name
    @raw_data = raw_data

    find_card! unless @raw_data
  end

  def oracle_text
    @oracle_text ||= @raw_data['oracle_text']
  end

  def name
    @name ||= @raw_data['name']
  end

  def abilities
    @abilities ||= oracle_text&.split("\n")
  end

  def stats
    return [] if @raw_data['type_line'].downcase.include?('land')
    DefaultStats.all.select { |stat| stat.match?(oracle_text) }.map(&:key)
  end 

  private
  def find_card!
    scryfall_uri.query = URI.encode_www_form({ exact: @name })
    
    response = Net::HTTP.get_response(scryfall_uri)
    raise StandardError.new(response.message) unless response.code == '200'

    @raw_data = JSON.parse(response.body)
  end

  def scryfall_uri
    @scryfall_uri ||= URI('https://api.scryfall.com/cards/named')
  end
end

if $0 == __FILE__
  card = Card.new(name: ARGV.first)
  puts "#{card.name} can help you with: #{card.stats.join(', ')}"
end