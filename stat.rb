class Stat
  attr_accessor :key, :terms

  def initialize(key:, terms: [])
    @key = key
    @terms = terms
  end

  def match?(ability)
    ability.match? terms.join('.*')
  end

  def self.mana_symbols
    %w{ {W} {U} {B} {R} {G} {C} }
  end

  def self.lands_terms
    %w{land Forest Plains Island Swamp Mountain}
  end
end