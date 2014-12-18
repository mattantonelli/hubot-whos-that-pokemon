# hubot-whos-that-pokemon

Play "Who's That Pokemon?" with Hubot using the Gen I lineup. This is an easy version of the original, since it uses the real images instead of silhouettes.

Pokemon information provided by [Pokodox](https://github.com/TrevorS/pokodox).

## Installation

In the Hubot project repo, run:

`npm install hubot-whos-that-pokemon --save`

Then add **hubot-whos-that-pokemon** to your `external-scripts.json`:

```json
["hubot-whos-that-pokemon"]
```

## Sample interaction

```text
mattantonelli> hubot poke play
Hubot> Who's That Pokemon? https://33.media.tumblr.com/860a69e3b72f02cc8268ff766768c794/tumblr_ngqwjw0Yjp1u650quo6_250.jpg
mattantonelli> hubot poke it's ponyta
Hubot> You got it! It's Ponyta!

mattantonelli> hubot poke play
mattantonelli> hubot poke it's bellsprout
Hubot> Nope. Try again!
mattantonelli> hubot poke give up
Hubot> It was Victreebel!
```

