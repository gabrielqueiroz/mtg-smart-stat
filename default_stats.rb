require './stat'

class DefaultStats
  def self.all
    [
      # Draw
      Stat.new(key: 'draw', terms: ['draw', 'card|cards']), 
      # Ramp
      Stat.new(key: 'ramp', terms: ["(#{Stat.lands_terms.join('|')})", 'onto the battlefield']),
      Stat.new(key: 'ramp', terms: ['play', 'additional lands']),
      Stat.new(key: 'ramp', terms: ['{T}:', 'add', "(#{Stat.mana_symbols.join('|')})"]),
      # Single target removal
      Stat.new(key: 'single target removal', terms: ['destroy target']),
      Stat.new(key: 'single target removal', terms: ['exile target']),
      Stat.new(key: 'single target removal', terms: ['return target']),
      # Board Wipes
      Stat.new(key: 'board wipe', terms: ['destroy all']),
      Stat.new(key: 'board wipe', terms: ['exile all']),
      Stat.new(key: 'board wipe', terms: ['return all']),
      # Board Wipes with Overload
      Stat.new(key: 'board wipe', terms: ['destroy target', '\noverload']),
      Stat.new(key: 'board wipe', terms: ['return target', '\noverload']),
    ]
  end
end