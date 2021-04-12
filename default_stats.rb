require './stat'

class DefaultStats
  def self.all
    draw + ramp
  end

  def self.draw
    [
      Stat.new(key: 'draw', terms: ['draw', 'card']), 
    ]
  end

  def self.ramp
    [
      Stat.new(key: 'ramp', terms: ["(#{Stat.lands_terms.join('|')})", 'onto the battlefield']),
      Stat.new(key: 'ramp', terms: ['play', 'additional lands']), # Azusa
      Stat.new(key: 'ramp', terms: ['{T}:', 'Add', "(#{Stat.mana_symbols.join('|')})"]), # Sol Ring / Mana dork
    ]
  end
end