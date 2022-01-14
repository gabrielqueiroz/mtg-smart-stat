require_relative '../deck'

RSpec.describe 'Deck' do
  describe '#cards' do
    context "when muldrotha deck" do
      let(:deck) { VCR.use_cassette('muldrotha_edh') { Deck.new(file: file_path) } }
      let(:file_path) { "#{RSPEC_ROOT}/fixtures/example_decks/muldrotha_edh" }

      subject { deck }   

      it 'finds all cards from scryfall' do
        expect(subject.cards.size).to eq 84
      end

      it 'returns deck stats' do
        expect(subject.stats).to include(
          []=>49,
          ["ramp"]=>5,
          ["draw"]=>16,
          ["single target removal"]=>7,
          ["draw", "ramp"]=>4,
          ["draw", "board wipe", "board wipe"]=>1,
          ["board wipe"]=>1,
          ["ramp", "single target removal"]=>1
        )
      end

      it 'returns summary' do
        expect(subject.summary).to include(
          {
            name: "Coiling Oracle",
            stats: ["ramp"],
            subtype: "Snake Elf Druid",
            supertype: "Creature"
          },
          {
            name: "Courser of Kruphix",
            stats: [],
            subtype: "Centaur",
            supertype: "Enchantment Creature"
          },
          {
            name: "Daring Apprentice",
            stats: [],
            subtype: "Human Wizard",
            supertype: "Creature"
          },
          {
            name: "Demonic Vigor",
            stats: [],
            subtype: "Aura",
            supertype: "Enchantment"
          },
          {
            name: "Dimir Aqueduct",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Dimir Guildgate",
            stats: [],
            subtype: "Gate",
            supertype: "Land"
          },
          {
            name: "Embodiment of Spring",
            stats: ["ramp"],
            subtype: "Elemental",
            supertype: "Creature"
          },
          {
            name: "Emergence Zone",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Eradicator Valkyrie",
            stats: [],
            subtype: "Angel Berserker",
            supertype: "Creature"
          },
          {
            name: "Evolving Wilds",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Field of Ruin",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Forest",
            stats: [],
            subtype: "Forest",
            supertype: "Basic Land"
          },
          {
            name: "Foul Orchard",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Gift of Doom",
            stats: [],
            subtype: "Aura",
            supertype: "Enchantment"
          },
          {
            name: "Golgari Guildgate",
            stats: [],
            subtype: "Gate",
            supertype: "Land"
          },
          {
            name: "Golgari Rot Farm",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Gonti, Lord of Luxury",
            stats: ["draw"],
            subtype: "Aetherborn Rogue",
            supertype: "Legendary Creature"
          },
          {
            name: "Grim Backwoods",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Grim Haruspex",
            stats: ["draw"],
            subtype: "Human Wizard",
            supertype: "Creature"
          },
          {
            name: "Hedron Crab",
            stats: ["draw"],
            subtype: "Crab",
            supertype: "Creature"
          },
          {
            name: "Hostage Taker",
            stats: [],
            subtype: "Human Pirate",
            supertype: "Creature"
          },
          {
            name: "Island",
            stats: [],
            subtype: "Island",
            supertype: "Basic Land"
          },
          {
            name: "Jarad, Golgari Lich Lord",
            stats: [],
            subtype: "Zombie Elf",
            supertype: "Legendary Creature"
          },
          {
            name: "Magus of the Abyss",
            stats: ["single target removal"],
            subtype: "Human Wizard",
            supertype: "Creature"
          },
          {
            name: "Massacre Girl",
            stats: [],
            subtype: "Human Assassin",
            supertype: "Legendary Creature"
          },
          {
            name: "Memorial to Unity",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Midnight Reaper",
            stats: ["draw"],
            subtype: "Zombie Knight",
            supertype: "Creature"
          },
          {
            name: "Millikin",
            stats: [],
            subtype: "Construct",
            supertype: "Artifact Creature"
          },
          {
            name: "Mind Stone",
            stats: ["draw", "ramp"],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Mire Triton",
            stats: ["draw"],
            subtype: "Zombie Merfolk",
            supertype: "Creature"
          },
          {
            name: "Muldrotha, the Gravetide",
            stats: [],
            subtype: "Elemental Avatar",
            supertype: "Legendary Creature"
          },
          {
            name: "Mulldrifter",
            stats: ["draw"],
            subtype: "Elemental",
            supertype: "Creature"
          },
          {
            name: "Myriad Landscape",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Night Incarnate",
            stats: [],
            subtype: "Elemental",
            supertype: "Creature"
          },
          {
            name: "Omen of the Hunt",
            stats: ["ramp"],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Opulent Palace",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Perpetual Timepiece",
            stats: ["draw"],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Phyrexian Arena",
            stats: ["draw"],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Phyrexian Scriptures",
            stats: ["draw", "board wipe", "board wipe"],
            subtype: "Saga",
            supertype: "Enchantment"
          },
          {
            name: "Plague Boiler",
            stats: ["board wipe"],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Plaguecrafter",
            stats: ["draw"],
            subtype: "Human Shaman",
            supertype: "Creature"
          },
          {
            name: "Port of Karfell",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Ravenous Chupacabra",
            stats: ["single target removal"],
            subtype: "Beast Horror",
            supertype: "Creature"
          },
          {
            name: "Reclamation Sage",
            stats: ["single target removal"],
            subtype: "Elf Shaman",
            supertype: "Creature"
          },
          {
            name: "Ripjaw Raptor",
            stats: ["draw"],
            subtype: "Dinosaur",
            supertype: "Creature"
          },
          {
            name: "Sakura-Tribe Elder",
            stats: ["ramp"],
            subtype: "Snake Shaman",
            supertype: "Creature"
          },
          {
            name: "Sarulf, Realm Eater",
            stats: [],
            subtype: "Wolf",
            supertype: "Legendary Creature"
          },
          {
            name: "Seal of Doom",
            stats: ["single target removal"],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Secrets of the Dead",
            stats: ["draw"],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Shriekmaw",
            stats: ["single target removal"],
            subtype: "Elemental",
            supertype: "Creature"
          },
          {
            name: "Simic Growth Chamber",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Siren Stormtamer",
            stats: [],
            subtype: "Siren Pirate Wizard",
            supertype: "Creature"
          },
          {
            name: "Sol Ring",
            stats: ["ramp"],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Solemn Simulacrum",
            stats: ["draw", "ramp"],
            subtype: "Golem",
            supertype: "Artifact Creature"
          },
          {
            name: "Sorin Markov",
            stats: [],
            subtype: "Sorin",
            supertype: "Legendary Planeswalker"
          },
          {
            name: "Spore Frog",
            stats: [],
            subtype: "Frog",
            supertype: "Creature"
          },
          {
            name: "Springbloom Druid",
            stats: ["draw", "ramp"],
            subtype: "Elf Druid",
            supertype: "Creature"
          },
          {
            name: "Strionic Resonator",
            stats: [],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Sultai Ascendancy",
            stats: ["draw"],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Sultai Banner",
            stats: ["draw", "ramp"],
            subtype: nil,
            supertype: "Artifact"
          },
          {
            name: "Swamp",
            stats: [],
            subtype: "Swamp",
            supertype: "Basic Land"
          },
          {
            name: "Syr Konrad, the Grim",
            stats: [],
            subtype: "Human Knight",
            supertype: "Legendary Creature"
          },
          {
            name: "Tectonic Edge",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Terramorphic Expanse",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "The Eldest Reborn",
            stats: ["draw"],
            subtype: "Saga",
            supertype: "Enchantment"
          },
          {
            name: "Tolaria West",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Torgaar, Famine Incarnate",
            stats: [],
            subtype: "Avatar",
            supertype: "Legendary Creature"
          },
          {
            name: "Twilight Prophet",
            stats: [],
            subtype: "Vampire Cleric",
            supertype: "Creature"
          },
          {
            name: "Unbridled Growth",
            stats: ["draw"],
            subtype: "Aura",
            supertype: "Enchantment"
          },
          {
            name: "Underground River",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Volrath, the Shapestealer",
            stats: [],
            subtype: "Shapeshifter",
            supertype: "Legendary Creature"
          },
          {
            name: "Vraska the Unseen",
            stats: ["single target removal"],
            subtype: "Vraska",
            supertype: "Legendary Planeswalker"
          },
          {
            name: "Woe Strider",
            stats: ["draw"],
            subtype: "Horror",
            supertype: "Creature"
          },
          {
            name: "Woodland Stream",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Yahenni, Undying Partisan",
            stats: [],
            subtype: "Aetherborn Vampire",
            supertype: "Legendary Creature"
          },
          {
            name: "Acidic Slime",
            stats: ["single target removal"],
            subtype: "Ooze",
            supertype: "Creature"
          },
          {
            name: "Aid from the Cowl",
            stats: [],
            subtype: nil,
            supertype: "Enchantment"
          },
          {
            name: "Alchemist's Refuge",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Baleful Strix",
            stats: ["draw"],
            subtype: "Bird",
            supertype: "Artifact Creature"
          },
          {
            name: "Binding the Old Gods",
            stats: ["ramp", "single target removal"],
            subtype: "Saga",
            supertype: "Enchantment"
          },
          {
            name: "Blast Zone",
            stats: [],
            subtype: nil,
            supertype: "Land"
          },
          {
            name: "Bolas's Citadel",
            stats: [],
            subtype: nil,
            supertype: "Legendary Artifact"
          },
          {
            name: "Cathodion",
            stats: [],
            subtype: "Construct",
            supertype: "Artifact Creature"
          },
          {
            name: "Cauldron of Souls",
            stats: [],
            subtype: nil,
            supertype: "Artifact"
          }
        )
      end
    end
  end
end