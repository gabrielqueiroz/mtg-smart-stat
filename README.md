# MTG Smart Stat [POC]

A simple Ruby Script to find card stats:

```ruby
> ruby card.rb 'Sol Ring'
'Sol Ring can help you with: ramp'

> ruby card.rb 'Zimone, Quandrix Prodigy'
'Zimone, Quandrix Prodigy can help you with: draw, ramp'
```

You can also analyze a whole deck at once by passing a list of card names:
```ruby
> ruby deck.rb ./spec/fixtures/example_decks/muldrotha_edh
┌───────────────────────────┬────────────────────────┬─────────────────────────────┐
│ Card                      │ Type                   │ Stats                       │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Strionic Resonator        │ Artifact               │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Cauldron of Souls         │ Artifact               │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Sultai Banner             │ Artifact               │ draw, ramp                  │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Plague Boiler             │ Artifact               │ board wipe                  │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Perpetual Timepiece       │ Artifact               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Mind Stone                │ Artifact               │ draw, ramp                  │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Sol Ring                  │ Artifact               │ ramp                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Cathodion                 │ Artifact Creature      │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Baleful Strix             │ Artifact Creature      │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Solemn Simulacrum         │ Artifact Creature      │ draw, ramp                  │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Millikin                  │ Artifact Creature      │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Swamp                     │ Basic Land             │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Forest                    │ Basic Land             │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Island                    │ Basic Land             │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Acidic Slime              │ Creature               │ single target removal       │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Coiling Oracle            │ Creature               │ ramp                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Daring Apprentice         │ Creature               │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Embodiment of Spring      │ Creature               │ ramp                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Eradicator Valkyrie       │ Creature               │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Grim Haruspex             │ Creature               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Hedron Crab               │ Creature               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Hostage Taker             │ Creature               │                             │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Magus of the Abyss        │ Creature               │ single target removal       │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Midnight Reaper           │ Creature               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Mire Triton               │ Creature               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
│ Mulldrifter               │ Creature               │ draw                        │
├───────────────────────────┼────────────────────────┼─────────────────────────────┤
...
```

## The idea

As a commander player, I still have to manually organize my cards to have an idea of "ramp cards" or "board wipes". The goal of this tool is to automatize this process makes it easier to analyze a deck.

## How does it work?

We use [Scryfall API](https://scryfall.com/docs/api) and try to find stats related to the card oracle based on words combination. 

For example: A nonland card that contains an effect that includes "land" + "onto the battlefield" is categorize as [ramp](https://mtg.fandom.com/wiki/Ramp).