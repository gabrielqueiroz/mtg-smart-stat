# MTG Smart Stat [POC]

A simple Ruby Script to find card stats:

```ruby
> ruby card.rb 'Sol Ring'
'Sol Ring can help you with: ramp'

> ruby card.rb 'Zimone, Quandrix Prodigy'
'Zimone, Quandrix Prodigy can help you with: draw, ramp
```

## The idea

As a commander player, I still have to manually organize my cards to have an idea of "ramp cards" or "board wipes". The goal of this tool is to automatize this process makes it easier to analyze a deck.

## How does it work?

We use [Scryfall API](https://scryfall.com/docs/api) and try to find stats related to the card oracle based on a word combination. 

For example: A nonland card that contains an effect that includes "land" + "onto the battlefield" is categorize as [ramp](https://mtg.fandom.com/wiki/Ramp).