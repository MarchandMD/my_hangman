# Hangman Part 4
This is actually a continuation from the Alan_skorkin_deepdive_2.md...but whatever...

So anyway, I'm attempting to develop a feature to "load" a saved game in my hangman gem. 

Ok, so now that I've taken the introduction out of the `#play` method...what else can I do? 

Well, I wnt to work a little bit on the interface...because now that I've een playing the game a bunch, I've noticed som things about it that i'd like to change. 

I need a brush up on the `case` statements...

Ok. so now my game is setup to accept either the inputs of p, l or i. to play, load a saved game, or instructions. 

I feel like putting the `while` loop into it's own method...but I don't know if I really want to. 

I mean, I don't know why i'd do that...because what I want to do is I want to maintain focus on the purpose of loading in a solution....from a YAML file. So i'm going to continue to focus on that. 

Because the point was...the point is...to look at the `Game#play` method...and provide a pre-determined variable for the `Solution`...

And the next thing I notice is...again my `Solution` is being set, prior to it actually needing to be set...

But only if I'm actually opting to play the game should I set a new solution. 

but it's not that I should pull the `while` loop out of the `play` method...it's taht I should pull anything that isn't actual game play out of the `#play` method...

So now, here's what I have introduced: 

```ruby
 def play_load_or_instruct
  case user_choice
  when "p"
    self.solution = Solution.new(words.sample.chomp)
    display_board
    play
  when "l"
    # load_game
    puts "you pushed L"
  when "i"
    display_instructions
    self.solution = Solution.new(words.sample.chomp)
    play
  end
end
```

So the point here is...I now have three different ways to handle the output of the `#user_choice` method...