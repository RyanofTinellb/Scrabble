# Scrabble
Scores words in accordance to the rules of Scrabble

This was created as a code sample for the [Hooroo Academy](http://academy.hooroo.com/).

To use:

```ruby
> game = Scrabble.new
> game.score("hello")
=> 8
> game.score("cabbage")
=> 14
> game.score("")
=> 0
> game.score(nil)
=> 0
```

To include bonuses, append a String argument of the same length as the word being scored, consisting of
1. '-' no bonus
2. '2' double letter score
3. '3' triple letter score
4. 'D' double word score
5. 'T' triple word score

```ruby
> game.score("hello", "-2---")
=> 9
> game.score("hello", "-3---")
=> 10
> game.score("hello", "-D---")
=> 16
> game.score("hello", "-T---")
=> 24
> game.score("hello", "-2-D-")
=> 18
> game.score("hello", "-D-T-")
=> 48
```
