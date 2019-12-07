#hangmanPart3
So i'm going to attempt to add a word from the dictionary to the solution. 

Now, I think I want to just start adding things to the file, and then build the method after I have the things. 

But this is a great opportunity to use RSpec to build the method. 

And maybe this is a good way to build a lesson for pair programming. 

I want the solution to be a word randomly chosen from the file in my root directory. 

So I'm going to be updating something in my existing script. 

The first thing to do is to identify what I'm going to be replacing. 

The way my game is currently set up...the `Game#play` method sets the `instance variable` of `@solution` to 

```ruby
Solution.new(words.sample)
```

So what I need to do then, is replace the `words.sample`. 

Because currently the `words.sample` is hard coded into my constructor method for the `Game` objecct. 

So then, I suppose what I could do...is change the hard coded Array that `Game@solution` is equal to, be a different array. 

And that would be the easiest change in the program. 

Because I know how to access a file with a `File` object, and I know how to push those results to an array. 

So i'll try that, and then maybe let that be a thing to refactor. 

And maybe these "things to refactor" are good ideas for pair programming. 

Wow, I got it to work! That's actually really exciting!

So yeah, I've created something pretty remarkable. And I did it in a relatively short amount of time. 

So the next thing is to figure out the drawing of the character. And that's kind of the last "Big" piece of this program that I really want to work on. 

So...I need to think a little more about it. 

I mean, I think I sort of saw yesterday how to handle this. 
 
I can't begin to explain how good this feels..... It's pride. I mean, maybe I can actually desribe how good it feels. 

So really, the next thing I want to focus on is making the Hangman appear on the screen. 

And I know I could use `File` objects to grab the files....and display the hangman....I might have a little more control over what get's displayed. 

But do I want to make a bunch of unnecessary files? I mean, how else might I do it? 

I think this is a good place for RSpec. Because I know I can...

...but wait...I think I just got a step closer to the elegant solution....

just doing

```ruby
arr = [1, 2, 3, 4, 5, 6]

puts arr
```

results in 

```ruby
1
2
3
4
5
6
```

And that's exactly what I'm trying to make happen: 

i'm trying to make an array display vertically... so maybe all I need to do...is ...

Well, how would I make someone lose a game?

That's downstream. For now, focus on the construction of the hangman...

Ok, so I have a general idea of how this method is going to work. I mean, I see it is operational to the point that I am relatively satisfied with how it's displayed. 

Now what I need to do is figure out how to incorporate it's behavior in the flow fo the game. 

Ok, so I have some bugs.

Ok, so I've got the board updating on every turn. But that's not how I want it to operate. So I really do need to be on the dev branch. 

So i'm going to start doing my work on that brnahc. I now feel like it's not necessary to have every thing on the dev branch, but rather to go ahead and some of the stuff in the production branch. 

Ok, so what is it that I'm needing to do? 

I mean I have a lot of good parts for the game right now. And I just created a lot of good parts...
 
Ok, so now, i'm on the 'dev' branch, and I have a lot of things that I cna do. 
 
Well, let's start adding things, piece by piece....
 
The first thing I want to do is remove the gallows when the game is started....
 
So after I hit 'p'...
 
So, the hard coded program calls the `#display_board` method now...
 
So, the `#display_board` is making a call to the `#gallows`...
 
But I don't want to call gallows now. 
 
I want to call something else. and I'll want to usually call something else. 
 
And in fact, i'll NEVER want to call `#gallows` here. 
 
The easiest thing to do is simply to call `#updated_gallows` now. And see what that does, as is..
 
I've now changed from 
 
```ruby
gallows
# updated_gallows
```
 
to 
 
```ruby
# gallows
updated-gallows
```

Ok, so this will completely remove the gallows on turn one. 

Which is exactly what I want to have happen. 

But what happens when I make a bad guess?

I made a bad_guess...but the gallows did not update. 

So now I'm going to take a look at the `#update_gallows` method. 

Ok, so I need to dig into the `#update_gallows` method. 

I feel like this is a good opportunity to use testing to get the metohd to do what I want...

hmm..ok, so the test suite has become a pain in my ass. Because I now need to maintain it. And that means some how getting `game_spec.rb` to accept and use the `dictionary.txt` to populate the words. 

Huh...I don't know if I wnat to dive so deep into RSpec right now. 

I mean, I feel like I can sort of tease the solution out of this...

yeah...so this is long and involved. And going this route makes a lot of changes to specific things....like the file path used for the dictionary. Which means that I have to break the game to make the test suite work. 

so getting more familiar with RSpec is a thing...but I feel like pushing that off to the RSpec module. 

So back to what I'm working on...

So `#update_gallows` expects to receive a letter but if the letter parameter is nil, I want to...instead of attempting to manipulate the display of gallows via the `@bad_guess` value...I'd rather do something easier. 

Ok, so now, instead of de-bugging something else, I'm debugging `#update_gallows`. But I always was sort of doing this, so this is fine...

Ok, so I'm thinking and thinking about this...but am I really? No not at all. Im not at all attempting to get a solution to this. 

So I need to focus. I need to really buckle down and drown out the other distractions. BEcause I'm really letting these other disctractions get the beest of me now..

This is a feature I really want to add to this game. So i'd like to focus a little more on it. 

So...what are some of the issues I'm experiencing? And what are the features I'm wanting to add? 

So, I want to step back and make the game do what I want it to do, in a predictable way, and I want to make smaller changes. 

Ok, so the crux of my problems are coming from the use of the `#update_gallows` method, so I'm goign to focus on the behavior of that method. 

Now a new avenue of investigation is the `#display_board` method, which does have a ternary statement that's using the `#update_gallows` method...

So, i'm using the `#update_gallows` method to change the `@bad_guess` instance variable...but that's not the right place for that...

That's not true....`@bad_guess` is being updated somewhere else...

So I want to remove the `board.update_dude` from the `update_gallows` method.

But that doesn't necessairly make much sense. 

Ok...so this is a little better. I'm getting close. 

What I need to do now is focus on the `#update_dude` method. 

ok, I think I have the `#update_dude` method showing fine now. 

Now what I need to do is work on the flow of the thing. The flow of the game. So, what can I do? After I hit the 'p' button, what happens? 

Awesome. I dont' know how I did this, but I got the game to work. I got the hangman showing up.


Now I need to start working on some ending techniques. Like...when the game is over. Or when the hangman is complete, ending the game. 

I think what I'd like to do is identify a place in the flow where it belongs.

And that's one of the neat parts of programming...I get to think about the idea of how to make the differet parts of the software work...and then I think about flow...and how things progress. 

so where in the flow of the game would I like to put a call to a `#game_over` method? 

It's the `while` loop in the `Game#play` method. 

I have a conditional on it now.

and that conditional is: 

```ruby
while board.letters.length.positive?
```
but I can easiliy change that. 


Ha!

So I both won and lost!

Now I need to understand how to exit out of the game gracefully....

Ok, so now what? 

I mean, does the game have all the basic functionality I'm looking for? 

Is there anything else I really want this game to do? Aside from the save functionality. And the load functionality? 

I mean, I think for the most part it's doing what I want, and any other re-factoring might not be that serious. 

And/or the features I'd be adding would be pretty easy to add at a moments notice. Or at least to conceptualize it'd be easier. 

so I think with a little more real world testing I'd be able to go ahead and add the save/load feature. For the game. 

Yeah, I'm satisfied with the play of the game at this point, and I think I'm able to start focusing on adding the functionality of saving or loading a game. 

But before I do that, I'm going to go ahead and look at the lesson, to find out if I'm doing all the things it's asking me to do. 

Becaue really this is what the lesson is supposed to be about. It's supposed to be about the saving and loading of the data. Or about the SERIALIZATION. So I suspect I may have to go back and think about or read about how the things work. 

>Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects… you can serialize your game class too!


Ok, so this is the flow of the game. How do i wnat to go ahead and do this?

1. at the start of each turn...

So how do I start a turn? 

With the `#take_a_turn` method, obviously (yay to me for chosing a great name for this method!)

Ok, so the easiest thing that comes to mind, is setting up a smaller loop right inside the `#take_a_turn` method, that runs prior to the other loop. 

Ok, now i have the option to save. But it doesn't actually do anything! LOL. 

Ok, so now I need to figure out how to. 

So it's time to look backwards into how to serialize my program...from within the program....

Ok, so i went up to the Files and Serializaiton lesson, and immediately, what I started thinking about was....if I have a bunch of game saved...loading this is merely opening a `File` object...which gives me practice opening a `File` object. 

And thankfully, the conversation with Robert has set me up for a good understanding of how to take input from a user and use it to access a specific file. 

Now that I read a little further into the article, I'm pretty sure I'm going to be using the `IO` object...and that's sort of coming ack to me. But if I have to re-read this entire lesson, I will. 

But something tells me I won't have to. 

>If you want to do more detailed stuff like write to a specific point in a file, you’ll need to figure out what position you’re at first, since you may be in the middle of it somewhere.

...this seems like an important idea to keep in mind while i'm thinking about loading specific files. Like: 

###Will I need to locate a specific location to pick up the game from where I left off?

But that's not until the next step. My goal now is to figure out how to create output that stores a game. 

See..now that I'm re-reading this article, this is what I love about this curriculum: 

> Working with files gets you into the idea of serialization, which basically just means converting your data into a storable format like a string. That’s very useful whether you’re thinking of saving your objects and classes (_say, when you’re in the middle of a game)_....

####LMFAO!!

I feel the need to go through this lesson all again, because I feel like, I did make a big effort to understand it, but now that I'm in a place to want to use the objects, I need to re-do my understanding of it....

Because I'm not going to know how to ......

well, before I try to incorporate the functionality into my game...why don't I try to incorporate the functionality into just an instance of the IRB..

Because I know there are somethigns that I wnat to be able to do....


like: 

1. Create a file. 
2. Get a name for the file
3. Save the file with a name of my choosing. 

And I think all three of those things are things i cna do from the IRB...as practice. 

So first guss is that it's using the `File` class to create a file...and then being able to write to that file. 

So that's a basic thing that I leanred from the LRTHW lessons. 

So...search for that lesson. 

Or brute force my way through it...

Ok, so now, I have a directory where i want to start creating blank files. 

I'm goign to start by jumpgin into that directory and making a file from there....

wow...ok...so to create an empty file in my current directory, all i need to do is 

```ruby
first_file = File.open('first_file.txt', 'w')
```

and then in my current directory, i now have a file titled: 

```
first_file.txt
```

Ok, so then, what's the next thing I wnat to do? 

Do I want to...try to create a file in a different directory? 

Or do I want to try to specify a name for the file? 

Or do I want to try to add text to the file? 

I think I want to try to write stuff to the file. 

But how? 

nope, that didn't work. Ok, so now I have to find out a little more about working with the `File` class. 

Do I wantn to go to the ruby-docs, or do I want to go to the leson? 

I kind of want to go to the lesson. 

Actually, it did work. 

I mean, the thing that I wanted to hav happen, happened. But I also learned somethingi else: 

When working with a `File` object, I need to be spsecific about the file extensino that im' passing. 

Ok, so what have I taught myself now? 

I've taught myself how to create a File object, how to write to a `File` object and how to close the `File` object. 

but how does that work in the flow of what I'm doing? 

How do I specify to write the entire program to a file? 

Because if `stdin` is standardIn and `stdout` is standardOut....

I think this is where the serialization comes from...

Am I going to have to do something more complicated then simply writing the entire program to a file? and then loading that subsequent file back to the RubyEngine?


Dammit. This isn't going to be an easy fix. This is actually going to be a lot more invovled. So I'm going to go ahead and spend some more time with these articles. 

Now that I know that I have a working game, and that I'm goign to be simply plugging in other things...I'm going to do that. I'm going to focus on learning how to set up the program to perform certain behaviors. And then I'm going to learn how to do the things I want to do, and then go from there. 

For the most part, I have the generalization about...saving the game. 

So I can go ahead and switch back to focusing on this I/O and serialization lesson...

...but before I do that, I think I want to wrap up the EventManager project, since it's a little more straightforward to finish, I believe. 


 