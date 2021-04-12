require './card'
require 'net/http'
require 'json'

class Deck
  attr_accessor :raw_cards, :raw_data

  MAX_CARDS_PER_REQUEST = 75

  def initialize(file:)
    @raw_cards = File.open(file).readlines.map(&:chomp)

    find_deck!
  end

  def analyze_deck
    @cards = @raw_data.map { |data| Card.new(raw_data: data) }

    summarize_cards
    overall_stats
  end

  private
  def summarize_cards
    @cards.each do |card|
      puts "#{card.name} - #{card.stats}"
    end
  end

  def overall_stats
    @cards.map { |card| card.stats }.inject(Hash.new(0)) { |h,i| h[i] += 1; h }
  end

  def find_deck!
    @raw_data = Array.new
    while @raw_cards.any?   
      http = Net::HTTP.new(scryfall_uri.host, scryfall_uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(scryfall_uri.request_uri, {'Content-Type': 'application/json'})
      request.body = payload(@raw_cards.pop(MAX_CARDS_PER_REQUEST)).to_json
      response = http.request(request)
    
      raise StandardError.new("#{response.message} #{response.body}") unless response.code == '200'
      result = JSON.parse(response.body)

      @raw_data += result['data']
    end

    @raw_data
  end

  def scryfall_uri
    @scryfall_uri ||= URI.parse('https://api.scryfall.com/cards/collection')
  end

  def payload(cards)
    {
      'identifiers': cards.map do |raw_card|
        { name: card_name(raw_card) }
      end
    }
  end

  def card_name(raw_card)
    raw_card.split(" ").drop(1).join(" ")
  end
end

if $0 == __FILE__
  deck = Deck.new(file: ARGV.first)
  puts "#{deck.analyze_deck}"
end