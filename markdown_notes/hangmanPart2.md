# hangman Part 2

| to do items|
|---|
~~update hidden_solution~~|
~~no more letters available~~ (will never give the person 26 guesses)|
~~attempting to guess an unavailable letter~~(validation completed)|
~~improve input validation on `#take_a_turn`~~|
improve validation for `Game#user_choice` in the `Game#play` method|
build out the `Game#instructions`|
~~display the name of the game by default~~|
~~randomize the secret word, from an Array~~|
add the actual, visual, hangman|


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

Wel, to start...I won't need to call `board.hide`...

And it suddenly seems silly to have a `Board#hide` method...doesn't it? No...it makes total sense. Because I want the `Board` to `#hide` the solution. 

So I'll leave that as it is. 

But the `@hidden_solution` now is defined in the `Board` class, and it is instantiated to a value of: 

```ruby
@hidden_solution = hide(solution)
```

and that makes sense to me. because `#hide` is a method of the `Board` class, and it'll hide the solution...ok. got that. 

Next...I want to make sure this instance variable is working correctly. So I'm going to test it...

ok, so now, I have to maintain my Test suite....because I made a lot of changes in the code base...

Ok, so, i'm starting to appreciate the separation of dependencies in the test suite...I mean, I want to minimize the amount of "breaking" i do...

Ok, so now, I have some red in my test cycle that I need to address.

what am I currently testing? 

I'm attempting to test the setter method for the `@hidden_solution` instance variable. And it failed. 

Why did it fail? 

What code did I use in my unit test? 

```ruby
new_board = Board.new
new_board.solution = 'cow'
```

Ok, so what I'm attempting to do here is create a different solution, yeah? 

So i'm doing that.

But when i instantiated `new_board`...it created an instance variable of `@hidden_solution`...that is not at all connected to changes in the `@solution` instance variable....

So then, does the `@hidden_solution` need to come out of the constructor method? 

I mean, it definitely seems like it absolutely has to come out of that.

But it is possible for me to change to setter method of `@solution` to do more than update the value....I could turn `@solution` into an `attr_reader` and then create a method called `Board#solution` that updates the `@hidden_solution`...but why? That seems silly. 

Why wouldn't I simply pull the `@hidden_solution` out of the constructor? 

Because it's a behavior that the `Board` will need to do. 

It will also need to change the `@hidden_solution`...so it'll ahve to output something different...so maybe I don't need a `@hidden_solution` instance variable at all, but rather, a `#hide` method....

so, i'm thinking about a lot...and there are a lot of things...a lot of variables that I'm considering...but what I'd liket to do is instead do something specific. That's the trouble with testing...it leaves me in the abstract..as opposed to shows me what I'm actually doing. And that's difficult to do. I need to see what is happening, what I'm asking the Engine to do...Because I don't know if I want to split the solution now, or later, how I want work with this thing....

or why I'd want to do this, or do that. Like, I can't tell what I'll want to do downstream...so the only thing I can really do is build now, and try to make it work...

so, why am I working on this `#hide_solution` method? I really don't know. I've completely lost the context of why I'm working on what I'm working on.

So I think I want to take a step back...and get out of the testing, and go back to the actual engine...

Ok, so the game still works...sort of. I mean it does a lot of what I'm hoping it'll do...but there are so many different things I could be working on. 

I want to just pick one thing, and attempt to focus on it. 

So, as I run my program, what's the first thing I notice? 

I notice my solution is being displayed as an Array....

So in the `Game#introduction` method is: 

```ruby
puts "#{solution.value}\n\n"
```

so, the `solution.value` is defaulting to an array...

I'm going to leave the actual object alone, because there are things that i'll want to do to it....

but it's really easy for me to manipulate the output in a `puts` call, so I'll do something here...

```ruby
puts "#{solution.value.join}\n\n"
```

Ok, solved that small issue...

Now what?

Now, I want to display the obscured_secret_word as a series of dashes and spaces...so how do i do that?

Well, I want to do something to the solution, don't I?

I want to do 

```ruby
solution.obscured
```

and that'll simply turn the entire solution into dashes.

Now, I've started to think about how to handle this.

I mean, I suppose what I could do is remove letters from an array that contains the secret_word, and when the length of that array is 0 then the game is over...but I'm focusing on something different than what I want to be right now. But that's what my brain is doing...it's chasing possible alternative solutions while I'm working on something else. 

What I want to do is continue to narrow my scope.

So yes, work on `solution.obscured`...

And this is a new method. So i'll write a test for it...

Ok, so i'm guessing a lot with my testing. 

I want to be more pointed. what am I attempting to do? 

I want to turn my current `@value` 

```ruby
['C', 'O', 'W']
```

into

```ruby
_ _ _
```

And yes, I was overthinking it. 

But I want to add some additional tests, to make sure it's doing what I think I want it to do. 

So the method I ended up writing was: 

```ruby
def obscured
  '_ ' * value.length
end
```

and this worked. 

Now I want to give it a couple more tests, to be sure. 

Ok, yeah, I'm confident it's obscuring the thing. 

so now, can I incorporate this into my `Game#play` method? 

Yes. I did. 

Ok. now what? 

Well, I was ableto update the available letters. but now what? 

I mean, something else I could do...

Do I need to add like a to do list? 

I mean, a manifest of the things I could be working on? 

Because there are so many different things that I'd like to do, and they all seems so fun to focus on. But I'm sort of pulling myself in different directions. 

Ok, so now the `Game#take_a_turn` method has too many lines.

so, how would I reduce the method? 

I mean, some method is going to have to be large, isn't it? 

Or do I reduce the method, and write the script to be larger? 

so the script is method calls, and control flow...

Because if I reduce the `Game#take_a_turn` method to return a value, then I could build another method...

Well, If I were going to reduce this `#take_a_turn` method, what would I do?

I'd reduce it to return a letter...a validated and proper letter, to pass to the next method...

Ok, so the idea is I might be able to reduce the complexity of hte method `#take_a_turn` if I were to actually think about it, instead of just continue to keep adding code to it. 

So I really should articulate: what dO I want this method to do?

Like, what do I want it to accept, adn what do I want it to return?

I mean, I think that's something I haven't thought about yet. 

Because really, I'm having the method do a lot more than just "take_a_turn"...I mean, I'm starting to throw all kinds of other functionality in there. And really, I should probably be breaking these things out into smaller sections...

so maybe the `Game#take_a_turn` method should prompt the user for a letter, and then return a letter...

I mean, that seems to be singular in nature. 

And this way I can remove the call to `board.remove_letter` and place that somewhere else.

But before I remove it, where am I moving it to?

Ok, well, the obvious thing would be to move it to the `Game#play` method.

but...the `board.remove_letter` needs some input. 

And this brings me back to the idea that the `Game` object needs another instance variable. And that would be the `@current_guess` or maybe the `@current_letter` or `@letter`.

Ok, so I feel like I've effectively reduced the `Game#take_a_turn` method down to a simpler purpose: 

Prompt for input, then validate and return the input

Now that I've updated the `Game#take_a_turn` method, I feel the need to test it....

Ok so what am I looking at? I'm looking at a test that, when initiated, went into an infinite loop...

So why did the loop begin?

Why didn't the method accept the parameter that I passed to it in hte unit test? 

Ok, so I think the issue is, the order of the method. 

I don't need to start the loop so soon...or I need to give the engine an opportunity to evaluate the parameter i"m passing in...

Ok, and I think I need to change this...this is where I need to re-factor from a `loop` to a `while` statement. 

Seriously, there is a lot of maintaining of this test suite....

ok, I think I've created the test to do the thing I want it to do...and now, to look at it...

I guess, what I want to do now, si see what it does live...

Ok, so, I think I've successfully re-factored the `Game#take_a_turn` method down to a simpler method. 

Now, what was the point for all that? 

IT was to produce or return a new `Game@letter` instance variable, so I can use it to update the `Board`. 

Now, how do I test this?

Alright, I'm 80% confident the method is return the thing I need it to return. 

So then, what's next? 

It's updating the board. 

could I do: `board.update`?

I mean, would that be ideal? Because I want to cut down on some things...I mean, I wnat the `Game` class to be as simple as posslbe. 
 But it's getting bigger...
 
 So yeah, what would the update method do?
 
 I can always build it, test first...
 
 Ok...so...I've done a horrible job of keeping my current progress, or my current changes up to date here in these notes. I think it's because I feel like the small changes i make ...like...I can't notate every little thing. Because I understand stuff, and I can make leaps....
 
 Ok, so what am I doing then? 
 
 Now, I have the basis for doing more. 
 
 I can show a basic board, I can make a guess, I can remove letters from the available lettes, I can get all the way through the entire alphabet. But then what happens?
 
 I feel like, all the toher htings I hvae to do with the program are actually fairly complicated. But if I just break things down a little at a time, maybe it won't be so bad. 
 
 Ok, so the next thing to focus on...is somehow populating the board....
 
 Um, ok, just focus on the issue. Like, how to do the thing that I want to do...
 
 So, what am I trying to do?
 
 I'm trying to create an array like: 
 
```ruby
['h', ' ', 'a', ' ', (...)]
``` 

but why? Why am I trying to create this? 

I already have the solution as an `Array`..and I already ahve the `solution.obscured`. Why do I need yet another array? I don't. 

What I do need to do is...compare the letter guessed to the letters of the solution. 

Ok, so 

```ruby
solution.include?(letter)
```

And that'll return true. 

Then what? 

I don't know if I need to do taht even...

But what's next?

If I do...

I need to replace the appropriate blank space in the obscured solution 

But the obscured solution...is something I want to have access to. 

But in what form? 

Do I want to have access to the obscured solution in the form of an array or the form of a string? 

I mean, I don't understand why this is so difficult. What am I trying to do? 

I have a `String`...that looks like `_ _ _ _ _ _ _ `

Ok, so maybe what I want to do is....iterate over the elements of the solution, and compare each element to the `Game@letter`. 

And then what? 

just do something simple for now. 

```ruby
solution.each_with_index do |x, i|
  if x == letter && i != 0
    solution.obscured[i*2] = x
  else
    solution.obscured[i] = x
  end
end
```

I'm having a really difficult time with this...and I don't know what it is i'm trying to do....

I mean, i'm trying to populate the board with a correct guess...And I think it's the data structure more than anything that's giving me a hard time. 

I mean, I'm worried too much about how this will view or print to the screen, and that should be the least of my concerns, becuase that's really teh easiest part.

I mean, i should be making this easier on myself...I don't know..I'm just completely stuck on this... and I don't know if I'm doing myself nay good by continuing to llinger on the issue. aT least not on my own...so..I mean, I think i'd like to try building something by testing it...but I'm not sure that'd help me. 

Why not just levarage the testing to the extent of it's purpose...

Now what do I want to this method to do? Very simply?

I want it to look at the `solution.obscured` instance vairable....

and eventually return it, correctly....

Ok, so now, I know that `#reveal` will return my `@obscured` instance variable, but so what? I need to do something else to it. 

So, update a single element in the instance variable....

I feel like I'm looking for a method or a capability that I have to write...

So I need to articulate it a little more...

so, i need to talk it out, and maybe extract this into something more abstract..or something simpler...

because what do I want to do?

I want to compare a single letter to all elements in an array. 

yeah? 

And can I get true/falses for that?

Ok...i think i'm on to something here. 

So what I was doing was

```ruby
mine = solution.value.collect { |x| x == letter } 
```

and this returns an `Array` that has `boolean` values...

Then, what I did was: 

```ruby
mine.map { |x| x == true ? letter : '_" }
```

So that's how I got multiple letters into it...

But I don't know how I'd persist the correct guesses. 

So, Um, this seems to be where I'm currently stuck. 

So how can I fix this? I mean, is this the only thing I can work on?

So, what I sort of what to do is just play around with a solution and an obscured version of it...

huh..ok, so I'm constantly trying things, re-doing things, and making major changes.

I think what I need to do is begin to employ git branches, because I'm trying things, and making massive changes to me code...instead of allowing myself to keep my changes...

So yeah, start using branches....

## issue solved: How to update the obscured solution with correct guesses
The issue I was having was this: 

If the secret word stored in `solution.value` has the same letter more than once, how do I make all the letters appear after that letter is guessed by the user? 

Well, I think thankfully I've been building my program by adding to the `Game#play` method...and that's been a series of methods called that do one very specific thing. 

And the issue i was having, was an issue of now knowing how to update the Board with the obscured word. 

But thankfully, I was at a point in the `Game#play` method that had all the objects available to me...I simply needed to figure out what the logic was. 

And this is what I came up with: 


```ruby
def play
  # additional code above this 
  solution.value.each_with_index do |x, i|
    if x == letter
      solution.obscured[i] = x
    end
  end
  #additional code after
end
```

This works because the `solution.value` is an `Array`...and the `solution.obscured` is also an `Array`...and I believe that both of these are also `@instance variables`. 

Yep. 

so i'm able to use `#each_with_index` on `solution.value`. 

then, I pass the block that says if the element of `solution.value` that I'm currently looking at is equal to the `game.letter` instance variable, then I should update the value of the `solution.obscured` at the location of `[i]` to be the value of the letter. 

And then it works. 

So that's awesome. 

Now, there's a lot of other things I need to be able to do. 

I guess the first thing I want to do is...do I want to move that code into it's own method? 

Ok, did it. That was fairly easy. 

So now what? 

Now, I need to look at the `solution.obscured` and i need to know if `any? == "_"`

Ok, I've got the end of game behavior solved. Sort of. 

Now there are a lot of other things that I sort of need to look at. 

Like, one off things. I mean, the game can either end by winning, or the player runs out of letters; I mean, that's really how the game should be played. 

I mean, why would I want to limit the number of turns they have? 

Well, that's the nature of HANGMAN...is that they have until there is a 'hangman' drawn. 

So, what do I need to do next? 

Because I sort of have the logic more or less done, right? 

I mean, not really. I still want to work on the logic. 

###No more letters available...
Do I need to develop this? I mean, if the user takes too many guesses, they'll lose, right? And there will be less than (<) 26 parts on the hangman. 

So then I guess i don't really need to build out the functionality to handle a situation where there are no more letters, right? 

So, i guess what I would like to do is figure out some way to allow the user to guess the solution. 

And that's got to be in the game play `while` loop, yeah? 

And that's sort of a different thing. 

I mean, it's kind of it's own thing. Like, I could ask at the beginning of every turn, would you like to attempt to solve the secret word?

Um...I suppose. Though that sort of game play gets a little tedious..having to answer y or n before very turn. 

alright so there's a lot of things that are still left to do. But there's a lot of functionality that's already been achieved. 

And I haven't necessarily used RSpec a tremendous amount. 

Is now a good time to build tests for the different methods I have?

I wonder what sort of an experience that would be like? 

Trying to build tests for my own program...

I mean, since that's kind of where I'm at, why don't I give it like 25 minutes, or until the end of this album. SEe what I can accomplish. 

Ya know, I just figured out that I could probably avoid this constant notating and un-commenting of the last two lines in the `Game` class file, if I just created a different file, required the `Game` and then instantiated the code there. 

Ok, so I added the `run_this_file.rb`...so now that saves me the commenting and uncommenting headache.

Honestly, I don't think I'm using the `Letter` class anywhere. 

Man, I'm actually really glad I decided to do this now. There was actually a lot of "bloat" in the project. 

I got rid of two unnecessary classes, and their associated spec files. 

Then I ran Rspec and found that I had to update the manifest file as well... Rspec, ti seems, is picky. 

Now I can start writing tests for the rest of the program...

I'll start with the `Board` class. 

I know that I definitely do instantiate a `Board` object when I'm running the `Game` class, so I do need to test this. 

And this is my existing `Board` class constructor: 

```ruby
def initialize(letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z])
  @letters = letters
  @solution = Solution.new
end
```

Now, I do instantiate the `Board` object with an Array optional. This means that I could instantiate it with a different type of object. 

it seems like a lot to have as the default value of the optional parameter. What if I moved it to the actual assigment...and out of the parameter?

And while I'm at it, I realize that I don't need to use the `@solution` instance in the constructor method. 

ok, so I learned a faster way to put the alphabet into an array. 

```ruby
[*('A'..'Z')]
```
So this is using the `splat operator`. Adn it's also using a range. 

So, i'm fairly confident that the `splat` operator will extrapolate, or expand something that is collapsed. 

So, a `splat` operator converts an `Array` to a list of items. As [this guy](https://www.rubyguides.com/2018/07/ruby-operators/#Ruby_Splat_Operator_Examples) says, it's like: 

> ...taking away the array, and replacing it with everything inside it.

But i feel like that definition is half-assed...ok, I don't really need to dig into this....

it's wild...this comfort level, this hubris...seems to continue to wrap itself in sneakier and sneakier ways...

I want to focus on writing tests for my existing classes.
Hmm, ok, so this is a little awkward...trying to write a better test. I think that I've acquired a simple understnading of the testing language. Though to write better tests requries more effort. More understanding. Going into greater depth with RSpec. Adn right now, I simply want to re-factor my code and write a few simple tests....


Yeah, I don't really want this to de-volve into a fight with RSpec. 

But what I'm experiencing is...writing these tests for my own program, I find that I am complicating the testing...or I'm wanting to be more specifci with my tests. 

Ok, so now the things I'm coming across are sort of...far out there...like, issues that sort of come up. 

Like, it's all about finding bugs...and being able to articulate those things. 


I feel like can do more things...like taking the training wheels off...

but maybe this is the point where I start using branches. 

I mean, if I'm goign to be re-factoring. and then I can merge the branch in after i'm happy with the changes I've made. 

it's just...it's a feel. it's a sense. 

ok, i've created a git branch now: 

```
git checkout -b refactor1
```

this creates, and switches to the branch, right away

Now, I can make any changes I want to this. Then, when I get to a point wher I'm stumped, I can merge it into the master, and keep working on the re-factor.

So, the re-factor..what's the goal with the re-factor branch? 

The goal is to clean up the game, little by little. 

Ok, so I merged the `refactor1` branch into the `master` branch. 

It's probably a good idea to start working more via branches. 

So what's the next thing I want to work on?

I think what I'd like to do is be able to create different words as a solution. 

So how would I do that? 

Well, the first thing I want to do is see how the word is currently being set. ok, so the solution is being created when the board is being initialized. 

So this is a behavior of the `Solution` object. 

But is it really? 

I mean, i think this is something that can go to the `Game` class...becaus really I feel like the selection of a secret word is sort of...a behavior of the game. 

so then what I'd do is I'd pull the `instance` variable out of the `Game` object instnatiation...

Ok, so here's my concern...if I am making a `Solution` object when I instantiate a `Game`...what will happen to the `Solution@obscured` value when I re-assign a value to the `Solution` object?

Because if I set the `Solution.value` to something else, that doesn't necessarily mean the `Solution.obscured` will be changed...does it? 

Wow, this is a really good question....

How do I test this?

maybe in the `Game` instance....

yep. Ok, so exactly what I was expeting. 

Ok, so here's where I'm at...I have a getter and setter method for the `solution.value`...but I actually think I want the setter version of the `#value` method to do something other than just take what ever I give it. 

So this would mean that I'm changing the `attr_accessor` method to `attr_reader`...at least for `:value`. 

and then I need to add: 

```ruby
def value= (word = '')
  word.split('')
end
```

actually, i'd want to pass an empty string, and not `nil`. 

And I'm doing this so......for no reason. I actually don't need to do this. I'm doing this to avoid doing what I know needs to be done...or what I think needs to be done. and that includes removing the ...

..no i don't want to remove th instance variable. but what I do want to do is, re-define th assigment by default. By default if it were an empty string, I could instantiate a `Solution` object later, and that way I'd still ahve the behavior/states of the `Solution` object, but it'd be matched to the random word. 

so next i'll: 

### change the default assignment to `Game#solution` to an empty string, and look for a new place to instantiate a `Solution` with a (psuedo)random value...

Honestly, as i look at my to-do list at the top of the page...I realize I'm repeating myself. I keep saying "input validation"...

But that's not what I want to do right now. So I guess that's the stuff I put off. For now. 

I am going to attempt to move the `Game#solution` thing. 

Nice! I got that working. 

So I think it's setup for scaling up at a later date. I want to actually work on some of that validation now....

so, where do I need to add validation? 

I think in `#take_a_turn`...

Um...wow...that was remarkably easy to do.

All I had to do was add an extra conditional statement in the `#take_a_turn` method. 

Specifically, I did this: 

```ruby
#what it was
input.length != 1 ? input = nil : break

#to what it is
input.length != 1 || !board.letters.include?(input) ? input = nil : break
```

So, if that was as easy as it was...what else can I do now?

Ok, so after the introduction, the user is adding some input. 

The way I current have it...is 

```ruby
user_choice == "p" ? display_board : display_instructions
```

and this assumes that anything besides 'p' won't start the game. And that's a little foolish...	

well, actually...it's failry responsive. I already have some validdation built in...but where? probably user_choice...

Ach..I did this all on the 'master' branch..when I'm really trying to get in the habit of building on the 	'dev' branch, adn then merging as I go. 

I don't want to do any actual building on the 'master' branch. I want to do all my building somehwere else, and only do merge requests into my 'master' branch. 

But that is a behavior i just started yesterday afternoon. And I was excited about adding this little feature...

Ok, so Im thinking about the addition of a board..like an actual hangman...and I'm wondering about how to populate the gallows with the progressive hangman. Like, first bad guess draws a body part on the board. 

and I guess I don't really know how to make thathappen. but I guess that's because I'm being stubborn, and not actually attempting to do tings. I mean, i already have an indication of what turn I'm on....

But what is it that I want to do? 

I want to get a result when the user makes a guess, and the solution does not contain the letter they guessed. 

So for now, just add some text to the script that appears ONLY when the user makes a guess from the alphabet that is NOT in the solution...

Ok, so the first thing I think i'd like to add is: 

```
YOU GUESSED: "B"
```
Ok. so I've got that now.

Ok. So what else?

Well, now I want to make some prompt appear: "Nope"...Ok, I got this to work...

But now I think I want to add some more validation...some more robust validation...

When the user enter a guess, I want to allow the user to type the exact word/solution...and if it's correct, then let them know they won.

I don't know. The more I think about this, the better I feel like it would be to just leave it. Llike, it's kind of satisfying to guess a letter and know it's going to be the correct letter. 

So, then the next part that I'd like to add, is the addition of the body onto the gallows. 

But how am i going to do that? How am I going to increment that? 

So, this requires a little more thought; LIke, how would I add the parts of the hangman incrementally? 

How would I add the hangman? It's not really making sense to me. But this is the thing to do. 

Well, if I keep track of the wrong guesses, I could say....

if wrong answers are 1, then I should show element (wrong answers - 1) on the board.

Then, if wrong answers are 2, I should show elements 0 and 1.
If wrong answers are 3, then I should show 0,1 and 2.

but then...how would I display the thing? 

I mean, the board itself is just a bunch of strings on the board. 

If I was to do string interpolation.......

But first, I want to put the hangman into an array....

I mean, what will I do then? I don't know..but I don't want to let this stop me from building the thing that I wnat to build. 

Maybe one thing I could do...is construct the gallows by string interpolation. And the way i would do this would be to put the entire gallows into an Array, and then to construct an empty gallows and display that. 

And then, as an incorrect letter is guessed, i could update the element of the array to be equal to a parallel array, that contains the actual hangman.

that might work. I mean, I have a vague idea about it. 

And I got the first part of the solution to work. I think I need to talk it out a little bit more. Because I generally understand what I want to do...and to have a specific idea that i can execute requires a greater understanding 