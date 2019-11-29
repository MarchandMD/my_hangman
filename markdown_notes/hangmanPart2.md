# hangman Part 2
I'm only calling this part 2 because it's the second markdown file. That's all. 

I left off from the previous file building the `Game#take_a_turn` method....and this is where things are really expanding...and almost expanding faster than I can keep track of. 

so I want to make sure that I continue to keep track of things....

so then, what should I work on? What additional functionality would I like to add...or do I need to add? 

I mean, right now what I'd like to do is give myself the ability to handle bad guesses. 

So that will include adding a little bit of flow control in the `loop` of the `Game#take_a_turn` method...

Ok, so, I'm developing the `Game#take_a_turn` method....and this is going to be one of those methods that I write out...and then compartmentalize. Like, there will be a lot of stuff in the method...and then I'll be able to pull some of the code out, and create other methods.

But for now...since I'm having some success with it, I'll keep going....

Ok...so a little note about what I'm doing.....I find myself constantly running the program, and testing it in a working environment. And occassionally going to the test suite. 

And for the most part that's alright, because I know that I need to learn how best to do this for myself. 

but I felt a real sense of..."man, I'm just repeating myself..." and that was like an indication for me to do something else.

Thankfully, i'm at a point in the production where I'm going to be attempting to implement a method...

...a method that I think I've already created...

in the `Board` class...

Now hold on for a second....

I have an array. And I have a letter from the user...

is there an `Array` method that'll allow me to remove that character? 

Holy cow. `Array#delete(param)`...

but I want to do more than just delete it. I want to replace it...

Ok, there's an elegant way to do this. But I don't necessarily want to spend too much time doing it. So..what I can do is

Ok...so here's what I've done: 

```ruby
board.remove_letter(board.letters.index(letter))
```

So, it's doing what i want it to do....

but there are some things I need to do.

That code, I need to be equal to the `Board@letters` isntance variable, because that's what's being displayed. 

ok, this is progressing much faster than I expected. and the onions I'm caramelizing are taking longer than I expected. 

That's alright; I feel like I understand for the most part what's happening. 

But the next part is to develop more game play....

I think what I want to keep doing is...keep going a little at a time...and making the program forward moving. 

then I can re-factor it down into something that is more managable, and loop-able. 

So...um...what do I need to do now? 

Um...wow...Ok, this is what I just did...

At the end of `Game#take_a_turn` I decided to return `Game#start_game`...and that displayed the board. 

so maybe I need to change the name of the `Game#start_game` to `Game#display_board`

Ok...so I could keep going in this forward progress...but that's not the thing to do now. 

the thing to do now is to add some more functionality to the game. 

And this involves doing something else with the guess the user makes.

What I want to do now is, in the `#take_a_turn` method, I want to update the `Solution` object, to `#add_a_letter`. 

I already have the logic setup, so I know when I'm calling the `#add_a_letter` method, and I know that I have a healthy parameter waiting for me....so I can do something to the solution. 

And what I'm going to want to do is add: 

```ruby
solution.add_a_letter(letter)
```

And I want that method to:  

1.  accept a parameter
2. locate the appropraite index (or indi, indexes?)
3. replace the "_" with the parameter

I won't need to do any validation, because I've already done validation before getting to this point. 	
And so, since I don't realy know how to make this function, I'm going to do some tests...

First thing is to make sure my test suite is working fine...

Now, am i convinced this is a method for the `Solution` class?

Because I'm acutally calling this in the `Game` class. 

But the `solution` instance variable is a `Solution` object, so I'm alright to create the `Solution#add_a_letter` method. 

Ok, so I've come up to a tricky part; and that is: 

How do I update the obscured secret word?

Well, what does "updating" include? 

Updating requires: 

1. knowing what the solution is
2. populating the obscured word with the correct letter

so, just try to do that...like on it's own...

and then figure out how to incorporate it...

Ok, i think I've found a way to do what I'm trying to do....

Because I can simply populate the index location of the `obscured_secret_word` like

```ruby
obscured_secret_word[secret_word.index(letter)] = letter
```

Ha! It works!

But now there's some more complexity I need to look at. 

How do I reveal all the values of a word? 

Like, if I guess "A" and the secret word has multiple "A"s in it...how do I reveal all the "A"s at once?

Well, can I do the opposite? Where I hide all of them? 

Or replace all of htem?

`String#gsub!` does what I want it to do...but I want to do it based on index. 

Because..what am I doing? 

I'm attempting to work backwards. 

But I ahve an obscured word. and I'm attempting to slowly reveal that word. 

Ok, so this is where some of the logic comes into play. 

I mean, this is where I ahve to learn how to solve a problem. 

Because I sort of have a solution...but it's not a complete solution. 

So take what I currently have, and build from there...

Hmm, ok...so what am i really trying to do?

This is a little tricky. 

I have a `Solution`. and I have a `Game@hidden_solution`. 

I already know that the `letter` is in the `Solution`. 

so what I need to do is: 

well, the first thing I want to do is put the solution into an `Array`, so I can have access to the Enumerable methods.

Maybe working with a `Hash` would be good to...but I'm not going to do that yet. 

I've probably done more than I really should have today. 

My brain is a little worn out. 

but I'm really enthused by what I've accomplished today. 

So I'm going to stop now and when I return, I'll go back to working on the issue of:

How do I make correctly guessed letters appear, when the letter appears more than once in the solution?

## 11/29
So, I feel like it'd be helpful if the code was less cluttered...

So I'm going to remove the clutter of the other `elsif` branches...

Because I'll always be able to add the logic back in....

So here's the current branch i'm working on, of the `#take_a_turn` method...

```ruby
 elsif board.letters.include?(letter) && solution.value.include?(letter)
  board.remove_letter(board.letters.index(letter))
  puts display_board
  self.turns += 1
break 
```

and I feel like I want to clean this up. 

The situation is: 

1. the guessed letter is available
2. the guessed letter is in the solution

The actions happening are: 

1. Remove the correct letter from the board
2. display the board
3. increment the `@turns` instance variable

Now, I don't necessarily want to break out of this loop right now..do I?

I'm simply breaking out of this loop now, for testing purposes. But that's not really what I want to have happen during the normal game play. 

What I'd really like to have happen is...

1. update the `@hidden_solution`
2. display the `@hidden_solution`
3. prompt the user for another guess

So I think I need to step back, and look at what is happening, and acknowledge how it isn't letting me do what I want. Because there's too much happening, beyond my control. 

So, in this `elsif` branch: 

1. I know the letter entered is validated as available, and in the solution
2. ~~I need to remove the letter from the `board#letters`~~
3. I need to update the `@hidden_solution`
4. I need to display the updated `@hidden_solution`

so, I think that's enough to keep me busy.

So then, how do I update the hidden solution?

...and I think i'm going to use testing for this. 

so, I want to call a method on the solution that allows me to iterate through it. 

But is my `@solution` an `Enumerable`?

No, it isn't. not by default. By default, my `Solution` object is a `String`. But I can change that in my constructor method. 

```ruby
class Solution
  attr_accessor :value
  
  def initialize(value = 'HANGMAN')
    @value = value.split('')
  end
end
```

and this will turn the solution into an `Enumerable` object (really an `Array`, but the `Enumerable` methods will be available to me. 

One more thing: Instead of forcing the solution to be entered as an upper-case or all caps word, I'll add the `.upcase` method onto it...

Now, as I think about adding an `#update` method...I realize that my `@hidden_solution` is actually an instance variable in the `Game` class...so then, I feel like I need to write a `Game` method to use on the instance variable. 

It's funny, but I feel like everything is sort of moving towards the `Game` class...huh. I'll pay attention as I move along...

So now, I have a solution object that is an `Enumerable` by default. 

What next? 

Ok, so I feel like the `:hidden_solution` should be part of the `Board` class...as opposed to part of the `Game` class, yeah? 

I don't think that needs a lot of justification. 

So, how does this change the `Game` class, where the `@hidden_solution` originally was? 

Well, the `@hidden_solution` was being turned into an `Array` on creation, and the `#joined` for display...

...and it was also being set to: 

```ruby
board.hide(solution.value).split('')
```

so, if I move this to the `Board` class...how will this change? 