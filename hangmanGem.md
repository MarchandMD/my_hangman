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

Wow...I really went down a different path than I would have expected when I was doing this the first time. 

I sort of have to go back and take a look at what I have been doing with this, to find out where I am. 

This is a good opportunity for me to also review the tests I currently have, and also maybe add some more functionality to the methods to allow me to test them....

Ok, so I've done a couple of things, since getting the program to it's current place. 

And I've attempted to do a couple of different htings, in terms of the overall appearance of the game...but I'd like to begin to focus on the behavior of the program. 

that is: I want to write the classes, and think about the objects, and how the interact with themselves and each other. 

So, here's what I do have:

I have a `MyHangman::Board` object instantiated in IRB. And I'm able to play around with it, and sort of figure out what it is, and what I want it to do. 

Now, as a rookie, the thing I like to focus on, or feel like I need to focus on, is the "tangible"...the "tactile"...the thing I can see. And that's the output to the screen. It's tough to move beyond that, because I rely on visuals frequently. 

ok...so I'm looking at the `Board` class first, because I feel like it's a conceptually easier place to sort of begin

Because what does the `Board` need? 

I've sort of already outlined that, at the begining of this article: 

And this is what I said there: 

The `Board` needs to: 

1. Display the available letters
2. Update the available letters

As far as the Board displaying the hangman character, and updating the hangman character...i'm not sure if that's necessasry to focus on now....I just...I'd rather have the program function properly. 

So I guess the natural place to start, is having the board display the letters of the alphabet...

Ok, so I'm at the point of creating a method to remove a letter

to remove a letter, I'd need: 

1. a reference to the available letters
2. an index number

Now, I expect the input to come in as a typed letter, so a string from the user. 

so the user will type "a", or "A" and I'd need to: 

1. convert it to either upper-case or lower-case
2. determine if it's an available letter
3. if it's not available as a guess, prompt for a new guess
4. if it is available as a guess, remove it from the available letters

Some other things I may need to do are: 

1. compare the guess to the solution
2. populate the board with the guess letter
3. populate the hangman with a new body part

But for now, I want to stay small and manageable. 

I want a method to update the available letters. 

Do I want to simply remove a letter? that'd be easy. 

```ruby
def remove_letter(index)
   board.letters[index] = ' '
end
```

theoretically, that's the easiest method. 

Then this begs the question, where does the `index` parameter come from?

Well, to start, I can test this. And I can test this by giving the index an optional parameter, which will allow me to test it

```ruby
def remove_letter(index = nil)
  board.letters[index] = ' '
end
```

So now...I can test this method. 

Ok, so yeah; I'm able to remove the letters. 

So what I want to do...is pass a `Guess` object to the `#remove_letter` method, in game play. 

so the idea is: 

* the user will somehow be prompted for a guess (I don't care about how right now...)
* Then they will type a letter into the terminal line

So at this point, I feel like I'd need to do a couple of things with this input. 

For example: 

1. standardize the input (make it either downcase or upcase, confirm it's length is only one; )
2. reject it (it's not included in the board.letters object, because it's already been guessed or because it's not a letter)

So, as I think about this, I know that I need to have these small functionalities...these individual methods....but then pulling them together into game play is more of the engine. 

so it's like, i'm constantly thinking about, or considering the engine. But I don't really need to think about it right now...because what I really want to do downstream is be able to:

```ruby
game = Game.new
game.play
```

And this suggests that I have:

```ruby
class Game

	def initialize
	end
	
	def play
	end

end
```

ok. So that's kind of what I'm driving towards. 

Now, i want to continue building the rest of the "roadmap" to getting there. 

I want an object to represent a guess, because I'm going to be doing a number of things with that guess. 

Also, while I'm thinking about it, part of the `play` method...or part of the game-play will be giving the player a chance to solve the puzzle. 

But that's downstream stuff for now. 

For now, what I'd like to focus on is the `Guess` object. 

Becaue the guess object is going to be a single letter. Or it's supposed to be a single letter. 

So then I can initialize a `Guess` object, and it should have a `:value`. 

Ok, so what I've been doing is...attempting to alter the instance variable, within the instantiation method. 

But that seems like a bad idea. 

Because what am I doing? I'm just attempting to validate the input. 

So, since the class is the only thing that's going to be doing this, can i go ahead and make this a private method? 

I mean, I don't know that I need to worry about public/private just yet...but I can create a method that does what I need it to. 

```ruby
def standardize(input = '')
  # ok here it goes
end

```

So, the idea is...I want to take the `guess.value` ( or I could probably pass it as `value`) and then make sure it's only one character long, and upcase it....

The easiest thing to do, is to start with a call to `.upcase!`.

Ok, so just like that, I begin trying to do too much. 

I just want this `#standardize` method to turn the `guess.value` to an uppercase letter. So that's the only thing I need to be doing right now. 

Ok, so now I've got some red that I need to take care of....

so I go over to the method...

Because i'm not prompting the user for anything, I don't need to do any sort of loop. 

But maybe that is where I'm at...the prompt for the input. 

Because what I want to do is ask for input. 

And if the input isn't valid, then I want to ask again. 

And I think this is sort of where Mocks come from, but I'm not certain. I mean, I think I can manipulate how the test runs....

Because it feels like...validating the input is a loopy thing. 

like, i'll loop to request input, and if the input is incorrect, then I'll redo the loop....or if it is correct, i'll set the `@value` variable of the guess. 

Now, I think...Um, I want to prompt, and I also want to validate, and standardize...

* So prompting requires just asking for input.  
* Getting the information is something different. 
* Validation requires making sure there's only one character, and that the character is a letter of the alphabet

So, the validation is sort of what I'm doing...or want to do now...

And so now, I think about the TicTacToe author saying something about not getting too granular with my tests. 

And so this feeling is something I should trust. But I need to go ahead and go this route, so I understand why it's a bad idea, or why it's frowned upon, or how I'm making my tests/program too difficult...

And then it'll be easier to "zoom out" a little bit...or 'pull focus' a little higher...

yeah, so this is kind of the thing....when I do the `#get_guess` method, I actually want to be creating a `Guess` object....so..this is the difficult part of it...

I've seen a couple of examples...so I don't really know what I'm trying to do...how I need to articulate it up. So i'll keep moving forward with this validation....

Ok...so the validation and the prompting sort of need to be combined. Because if they're combined, then I can loop and prompt...or prompt and loop if necessary....

Ok, so now that I have create a `#prompt` method, I feel like it isn't a behavior of the `Guess` object. 

I mean, yes, the `#prompt` is intended to get a `Guess` from the person, but that just means that the `Guess` should be a byproduct of the method...and not something that comes from within the class. 

So then, where should this method be? 

I feel like this is a method for the `Game` class. Because it's part of the Game-play. So then the I should be able to prompt.....but I'm prompting the player. 

So then it'd be something I need to do for the player. 

that seems to make more sense to me. 

Because what I'd like to do is: 

```ruby
player.prompt
```

And then i'm getting input from them. 

So then, what would I need to do to add this? 

ok...so..I'm created an instance method for the `Player` class...and the only thing I'm doing is giving them a name, that's all. 

And I think I'm going to comment out a lot of the `#prompt` method, because it is a little confusing, and I want to slowly build it up with red-green testing...

Hmm, ok...so now I have a working `Player#prompt` method....and I feel like I should probably write a littlem more about this. since I had to do a little work for it. 

```ruby
def prompt(input = nil)
  puts "Please enter a single letter: "
  loop do
    input ||= gets.chomp
    if input.length != 1
      puts "invalid selection. Try again: "
      input = nil
    else
      break
    end
  end
  input
end
```

```ruby
puts "please enter a single letter: '
```
obvious. next:

```ruby
loop do
```
I want to start a loop now. Because the thing that I want to do repeatedly is get user input if it's not correct. so then...next:

```ruby
input ||= gets.chomp
```
I'm pretty sure that what this means is "assign the value of `gets.chomp` to the `input` variable, if `input` doesn't already have a value. 

The reason I'm doing it like this is....for testing purposes. I should be able to pass a parameter to the method call like `Player#prompt('ab')` and get a response that I expect in the testing environment. So i'm going to do that now. 

Ok, so now I want to review how I hide the output to the terminal when I'm testing...

So, it's this line that I add to the `spec_helper.rb` file:

```ruby
# suppress $STDOUT in terminal
  config.before { allow($stdout).to receive(:puts) }
```

## 11/27/2019
Ok, so I have RSpec setup the way I like it (to not display output streams)...and I have a working loop to accept input...

but I think what's important now is...the idea that I have a working loop, that get's the guess from the user. 

It's not complete...but adding to it, I think, will be a little easier, now that I have a working loop. 

And how did I get to the working loop?

Instead of testing 100% to the correct answer, I used a combination of testing and the IRB....and requiring the file that held the question I was wondering about. And then I was instantitating individual instances of that class, to see how the method was behaving. 

And I think I made some real progress, in terms of understanding how to build a loop like the one I did. 

Now what I was doing was ripping apart every line in the loop and artciulating it's purpose. I'll pick up where I left off. 

```ruby
if input.length != 1
```

So before, I was trying to do something "fancy" with `!input.length`...but this conditional statement is so much easier to understand. I also feel like I'll be able to add to the conditional. Because I want to further validate the kind of input the user may supply. I want to limit the input to being an available letter. 

So part of me wants to use the `Board` object I was creating, and call the `#available_letters` method. Or just the `#letters/@letters` instance variable on the board. Because I'm going to be updating the content of the `@letters` through out the game, and then i can do something like: 

```ruby
if input.length != 1 && !board.letters.include?(input)
```

And I think, based on the scope...the method...does the method *not* have the ability to reference the `Board` object though? All these small ideas that I'm attempting to use are being solidified in my brain as I build my first program. I could probably pass the object in as a parameter?

```ruby
puts "Invalid selection. Try again: "
input = nil
```

Obviously the first line is self-explanatory. 

The second line though, I want to explain in this context...

So the two lines above are from the `if` branch in my conditional statement. And this `if` statement is inside a `loop`. 

The `loop` will, starting from the 1st line after the `loop do` line, and will do everything inside of it. So, looking at my `loop` statement, the `loop` will do these things: 

```ruby
input ||= gets.chomp
	if input.length != 1
	  puts 'invalid selection. Try again: '
	  input = nil
```

thse are lines 1..4 inside the `loop do` line. And so if the `input` (which is a parameter) is not a single character long, then Ruby will put "invalid selection, Try again: ". Then Ruby will **reset** the `input` variable (which was originally passed as a parameter) to equal `nil`. 

The next line of the `loop` is `else` which is the `else` of the `if` statement. I'm not going to discuss that right now, because it's not relevant to this current example, yet. But I should say that there is nothing else in the `if/else` statement, and nothing else in the `loop` statement...so the next relevant line that Ruby would encounter is the `end` statement of the `if` statement, followed closely by the `end` statement of the `loop`. 

This means that Ruby would then go back to the first line inside the `loop`...which is: 

```ruby
input ||= gets.chomp
```

So then, what does Ruby do? 

Well, this line says that if `input` already has a value, leave it be. Otherwise, `input == gets.chomp`. So I have an opportunity to set the value of `input` within the loop....so I'm sort of...interrupting the automatic behavior of the `loop`....and forcing it to wait for input from the borrower. 

Now, what if the conditional statement is false? What if the `input.length == 1`? 

Well, this would push the flow of the `loop` statement to the `else` branch of the `if` statement...

```ruby
  else
    break
  end    
end
```

So if the `input.length` is in fact equal to 1, break the loop. 

The `end` on line 3 above is the end of the `if` statement, and the `end` on line 4 is the end of the loop. But by calling `break` inside the `else` branch of the `if` statement, Ruby immediately ends the loop, and goes to the next line in the method, since the `loop` statement is part of a method. 

The next line in the method, directly after the `end` of the `loop` is

```ruby
input
```

So, why would I put this here?

Why would I put the `input` variable as the last line outside of the loop and just before the `end` of the method?

Also, could I re-factor the `loop` statement to use `while`?

I mean, I could, but why would I right now? I'll save the re-factoring for later. If it works now, use it, and move forward. 

So what's next? 

I guess I need to sort of get back into it. to get into the file...requires something. Requires some familiarity with what I'm doing, and where I left off. 

so what was I doing? 

I was attempting to build a `Guess` object...and the methods were sending me into a circle. that's why I decided to build a `Player#prompt` method. 

so is my `Guess` object complete?

I mean, the `Guess` object is meant to be a `String`...a single letter. Do I need to create an object for it then? 

I mean, maybe. I have it now, so I'll leave it as it is. 

Because in the TicTacToe gem, I needed a class...I needed a single object for the value of the Cell. Well, I needed a cell, and the cell ended up being it's own class. And that instance...that `Cell` object ended up containing a value. 

So I like the idea of having a Guess object. 

But the `Cell` object from the TicTacToe gem was used in a specific sort of way. 

It was used to populate the game board. 

So then how would I use the `Guess` object to populate an object in the Hangman game? 

It's awesome when I ask a question like this, because I'm already thinking of the answer while I'm still typing the question!

The answer I'm going to try first is: I'll use the `Guess` object when instantiating a `Solution` object. 

I'll want to talk about this a little bit. 

The `Solution` object will be the random word. It can be either auto-generated, or maybe, if I'm feeling over-achieving, I can allow the user to create the word and let the computer guess. 

but for now, solution will be auto-created. And I think that's part of the assignment too....to use a dictionary of words and randomly select from the dictionary, and chose one word as the solution. 

So then, the `Solution` object will need to have a `@word`. And whatever the length of the `Solution@word` is.....then I'll want to display the appropriate number of blank spaces on the game board. 

So then, it isn't a `Guess` object that I want to make...it's a `Blank` object I'm creating...or a `Cell`..I mean, what's wrong with calling it `Cell`? or `Character` class? or a `Letter` class? 

So then, it's not a `Guess`, it's a `Letter` class. 

I know I'm maybe stalling a little bit, but I'm thinking about the movement of the program while I'm doing these small things. 

Ok, so what do I want to do now? 

I'm thinking about the solution. And what the solution should look like. 

And thinking about that means, I'm thinking about how to display it. 

So, what I'd like to display is a dash, sort of like this: 

```ruby
_ _ _ _ _ _ _
```

And then, when the player makes a correct guess, do something like: 

```
H _ _ _ _ _ _
```

So, to do this, requires first, an ability to know what the solution is. So the method, whatever method it is I'm building, will accept a parameter, and that parameter will be the solution. 

So, there's a difference when I build: I need to build abstractly, sort of. Like, when building the program, I'm building the general behavior....and the engine will reflect the specific behavior. 

so, can I build both at the same time? Like, the engine will eventually run the game....but it will use the objects I create, and specifically will use their state and behavior to interact with each other. 

I feel like the "Engine" is like off limits...and that I should wait until the end...but maybe by looking at the Engine, I'll be guided along the path of what I need to build next...or what I need to return and what I need to build to accept whatever it is I'm returning. 

Because the engine is bringing things together...it's bringing the existence of the Game into being...and it's facilitating the Gameplay. 

So, the Engine is responsible for initiating everything...bringing everything together. 

So, yeah, I mean, I think building the Engine at the same time is probably an idea worth exploring...

So...I can initialize a `Game` object. And the `Game` object is sort of the "engine" that I've been thinking about. 

Ok, so what does the `Game#play` object need to do? 

Well, my brain wants it to welcome the player by presenting something that shows "HANGMAN" and the graphic. 

Maybe for now, just as a place holder, I can just put: 

```
HANGMAN

(p)lay
(i)nstructions
```

And that's all I want to do now. So, I somehow want to `puts` this to the screen. 

so then, how do I do this with a method? 

Ok, so now I know how to get this with a method. 

How do I make this appear automatically, when `Game` object is instantiated? 

This can be part of the `play` method. 

Ok...so I've done that now. What next? 

I want to wait for input from the user. yeah? 

or..no. I mean, that's not really fun...I mean, playing the game will be fun-ish...but what i'd like to do is actually change the "HANGMAN" that's listed there to be a `Solution` object. 

And so, my question is...what I'd like to do is actually show something like: 

```
H _ N G M _ N
```

or can I do something where I show a letter with an underscore underneath it? 

that acutally might be a little more difficult. But it's the easier option than finding like a box to display. 

Um, what do I want to do? 

Ok, so now...I've created a way to instantiate a game, and then when I call the `#play` method, it displays a `Solution` object. 

So now what do I want to do?

I should say that I'm not really using this to do any testing...but I don't necessarily know how to use testing to get up and running. So what I want to continue to do is build between the Engine, and the object methods and states. 

But it's a strange balance, because I'm building the objects, their states and their behaviors, while also attempting to build the Engine as well as the tests for it all. 

So I don't really know how to bring all those piece together. But I don't know that all those pieces need to come together. 

what I want to focus on, is the individual thing i'm working on...

Like, it's tough for me to do without visualizing. 

Well, ok, so I'm looking at the `Game` class, and specifically the `Game#play` method...

```ruby
def play
  introduction
end
```

And i think to myself...ok, i've run the introduction method...now what? 

Because that's what `#play` is doing...it's running the entire game. 

So, after an introduction, the user is given the option to either enter "p" or "i", and that will provide a response, depending on how they respond. 

So it's like the next thing the `Game` needs to do is expedite game play. 

Or rather it needs to validate input, and disposition the next step. 

So i feel like I'm setting up a loop to listen for input. 

I'd rather the `Game#play` method be a series of calls to other methods.

So I need to run `Game#user_choice` now.

And I know that I want to call this method now..but I haven't defined it at all. 

And this is where I can use testing to help me define it. 

So, now, my `Game#play` method looks like this: 

```ruby
def play
  introduction
  user_choice
end
```

And I need to create a `Game#user_choice` method, so the program will do something at this point. 

```ruby
def user_choice
  # do something
end
```

ok. Nice. So this is where I'd go to the test suite, and begin writing tests to fail. 

Ok, so I'm starting to build tests for `#user_choice`...

Yep. And now I've also begun using the hints from the Linter a lot more. 

I mean, it's really easy to accept the suggestions I find from the linter when it's my project...

So i'm at a point now, where I'm able to accept input, and I'm able to expedite the program based on the input from the user; either they select "i" and what some instructions, or the select 'p' and they start playing the game. 

So, I don't really want to spend a lot of time explaining or displaying the instructions because it's not really the programming part of things.

what I want to do is...focus on if they select "p"

So I feel like the `Game#user_choice` method is complete at this point. It does what it needs to do...and that's get the input from the user. So then, what is it taht the `#user_choice` method should be returning? 

I feel like the `Game#user_choice` method can simply return the `input`...this way the next line in the `Game#play` method is something like: 

```ruby
user_choice == "p" ? start_game: instructions
```

That way the `Game#play` method is flowing a certain way...

Ok, so I'm at a place where, I can either `#start_game` or I can `#display_instructions`. 

wow, this is actually progressing a little faster than I expected...

Ok, so, since I want to display the available letters...I'm pretty sure I already have an object that'll display the alphabet the way i want it to be displayed....

yeah, and that's the `Board` object that I'd need...

so now...in my `Game` object, I need to require the `Board`...

Um, ok...now that I have the `Board` object available to my `Game` object....I think I need to instantiate a `Game` object with a `Board` object. yeah?

Not necessarily, though it'll probably make things easier if I do. 

for now, I'm alright doing what I just did which is: 

```ruby
"available letters: #{Board.new.letters}"
```

...but now I need to figure out how to display these the way I want to display them.

Ok, I'm slowly doing more things. 

At least I'm creating the first part of the game play. 

So now, I want to remove some of the unnecessary..

Now the thing to do is...obscure the secret word with spaces.

And i think I already have that...

I didn't have it. I was doing something else to remove a guessed letter from the displayed alphabet. 

What I want to do now is....take a look at the new method I just created: 

```ruby
def hide(solution = nil)
  puts "_" * solution.length
end
```

And this takes the solution, and converts it to dashes...

Ok, so I'm having a little dificulty displaying it, for some reason...

And since I'm having some trouble with it...why not go to the test suite?!

first thing I need to do is clean up `solution_spec.rb`


Ok, I think I know why this is weird. 

It's because I want to do something to the `Solution` instance...like..

```ruby
convert_solution(solution_instance)
```

But, can't I do something like: 

```ruby
solution = Solution.new
solution.hide
```

Maybe I'm unnecessarily complicating it...

because don't I just want to do something like, just...

```ruby
puts "_" * solution.length
```

Ok...so the way this would work would be if I were passing the `Solution` object as a parameter to a method. 

So I think I want to put this method into a different class. 

So which class?

I feel like this would be something for the `Board` to do.

Ok, nice! I move the method to the `Board` class, and I got the method to pass the tests that I wrote. 

So now, I'm going to try to incorporate this method into my `Game` class...

Ok..so now...I see something...

Since I am playing one game...I only want one instance of a `Board`. 

So, I think it's smart of me to instantiate a `Game` with a `Board` object. 

Ya know...I feel like this is a little easier than it should be. 

But I think that just reveals more about me, and my own expectations as opposed to my actual ability....

So then, this makes me want to keep going....

So then, what's the next thing I want to be able to do with my game? 

Ok, so now, I can prompt the user for a letter, and it's the same as asking for a (p) or an (i)....

I mean, now that I'm done with `#start_the_game`...I can go back to `Game#play` right? 

yeah, I can... At this point, I could really start a loop...that drives towards a winner. 

but this begs the question: what makes someone a winner? 

Someone wins if they enter a guess of the solution word and it's an exact match. 

so then I need to be able to offer someone a chance to solve the puzzle. 

I could also limit the number of guesses. 

Oh wow. The game is really opening up to me. 

But I want to make sure I keep things narrow. 

And I want to make sure my naming is helpful. 

so now, what I want to do is maybe change the name of this `Game#start_game` to maybe....be something else. 

I don't know.. I mean, if I start changing the names of things, will that make it more confusing for me? 

Ok, so I feel like i'm doing a lot. I'm adding a lot of functinoality, and I need to slow it down. 

I'm also getting close to 6000 words, so I'm going to create a new file. 