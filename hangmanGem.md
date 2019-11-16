# Hangman Gem
1. Player
2. Solution
3. Guess
4. Board

The `Player` needs to:   

1. exist (`#new`)
2. guess a letter (`#guess_letter`)
3. guess the solution (`#guess_solution`)
4. create a solution (`#create_solution`)
5. save the game (TBD)
6. load a saved game (TBD)

The `Solution` needs to: 

1. exist (`#new`)
2. display it's blank spaces (`#hide`)
3. display it's progress
4. display it's complete self
5. be provided by computer
6. be provided by `Player`

The `Solution` is: 

1. a String, created by joining an Array
2. has a length
3. "Hangman", by default

The `Guess` needs to: 

1. exist
2. be made
3. compare itself to `Solution` instance
4. reduce the possible letters

The `Board` needs to: 

1. exist
2. display available letters
3. update available letters
4. display hangman
5. display progress of `Solution` and or the `Game`

So, there are some confusing bits...but there are some very clear pieces here. 

And there are some characteristics, and there are some behaviors. Now, I want to figure this part next. Which I think will let me play in IRB...

Ok, so I think I figured out how to, at the least, display a default board/solution:

```ruby

# This is the board itself, by default
board = [['h', 'a', 'n', 'g', 'm', 'a', 'n'],["\u{00AF}", "\u{00AF}", "\u{00AF}", "\u{00AF}", "\u{00AF}", "\u{00AF}", "\u{00AF}"]

# and this is how to display it
board.each do |el|
  print "#{el.join(' ')}\n"
end
```

And this will give me (live view): 

![image of default board](/Users/michaelmarchand/Desktop/screenshots/hangman/live_view_of_board.png)

Now, I can work with the solution...or the `Board` variable...but should it be the solution variable? Or should it be the board variable?  

I mean, this is the board, being displayed. 

So yeah, there's a lot of different things here. And I could even break these parts up into smaller parts. 

For example: 

```ruby
board[0] = solution
solution.length.times { board[1] << '\u{00AF}' }
```

So, I don't really know what I want to do now. I mean, there's a lot of small things I could be doing. 

I think it's definitely best to just start adding a lot of small things, so I can start to see how it might come together, and how the things might interact with each other. 

For now, I know I need to create those other classes....

Wow..nothing really allows me to pick up steam quite like doing the necessary things....So now, I really want to focus on this task, and move forward with the construction and testing of this game. 

Because I don't necesarily know how to structure it, but parts of it are starting to make a little more sense to me. 

Though I'm not really sure. 

I mean, what do I need to make as an object, and what do I need to make as a method? Or what do i need to make as a state and what do I need to make as a behavior. 

States and behaviors. That's kind of the distinction between the two. The state is how a thing is, a behavior is how it becomes that way. 

So, I'm thinking about this board again. And I don't really know...how I want the board to appear. I mean, I know I want to have the letters all appear at the top...and I have that. 

The next thing I want to have, is a solution. And I think...before I try to pull in the dictionary, I want to be able to have a solution. 

so I'll ahve a solution object. And when I create a new instance of it... what does it need? 

Ok, so yeah, I've got that. I have a `Solution` object. Now what do I need to be able to do? 

Now, is this really a method that has to be on the Solution? Or is this something the `Board` has to do? 

I feel like it's something the board needs to do. 

so like `Board#conceal_solution`? Maybe....I mean, the `#conceal_solution` will take in the `Solution` object, convert it to those unicode characters, and display it in the Board. 

So now, the `Solution` object doesn't need to `conceal_itself`...but the `Board` object does need to conceal the solution. So I'll go there. 

So the idea is that I'm using the testing suite to build the program...but I'm not necessarily doing that right now. What I am doing is guessing at the code that I need to write, and hoping that it'll work. 

What I want to practice with this program...is building from the test suite outwards. 

So, I'm not really sure what this needs to do

What am i trying to make this method do? 

Well, to start, I want the `Board` to display the `Solution`. 

So why not move in that direction. 

i want to be able to call `Board#display_solution`.... and then `puts solution` to the screen

ok, so now I have the method, and I have the test...time to break the test...

And I have a broken test. 

Now it's time to fix the test...  
Now it's time to break the the test...  
Now it's time to fix the test with updated code...  
Now it's time to break the test...  
Now it's time to fix the test with updated code...  
Now it's time to break the test...  
Now it's time to fix the test with updated code...  

..but truthfully, i'm not sure it is. I actually think...that this is more of a stubbing issue. 

But i'm not entirely sure what a stub is... so I think I need to revisit this portion of the TicTacToe article....

Because I need to create an object that actually ha a value...and it creates a speicifc object..but I don't necessarily want to create a specific object, or I don't want to test with a specific object...

Ok, so yeah, that's kind of where this is going...it's this idea of a "dependency"....my Board class is "depending" on the creation of a `Solution` object...And I don't know that I want to do that. What I want to do...because when I make the object, it memoizes it...or it makes it a very specific thing. 

So, I think this is where the Struct comes from. I'm actually going to go a little deeper into the TicTacToe tutorial than I expected....but I want to go as deep as I need to, to understand this concept of the Struct...because I think it's an important one....

## using Structs...
> Let’s use a Struct to create an object that responds to value messages instead of creating a Cell object and making a needless dependency in our test suite.

the `Struct` is a piece of `Ruby`.... so I can check it out for documentation. 

But before I go there, it "creates an object that responds to value messages"...

So, the `Struct` will create an object. 

And how do i use the `Struct`?

```ruby
Cat = Struct.new(:value)
```

In this code, what I've done is:  

1. Created a new "object" called `Cat`
2. I can now create instances of it with `Cat#new`
3. the `Cat` variable is actually a `Struct.new`
4. I passed a symbol as the parameter
5. I can use the symbol as a method: `Cat.value`
6. I can set the value of `Cat#value` by passing in a value as a parameter when I create the new `Cat` "object"
7. I can get the value of `Cat.value` or I can set the value of `Cat.value = whatever`

So that's how I'd use it in RSpec...

Ok, so i feel like this will take a lot more focus than I'm willing to give right now. 

But I am totally willing to work on one of my other projects....like the mastermind_bendee, or the events_manager project...so i'll switch to one of those...