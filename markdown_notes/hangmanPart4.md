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

Ok, so I'm sort of putting off the idea of creating the `#load_game` method.

And so what I'll start with is simply creating the method, and returning the value I currently have. 

Now that wasn't so difficult, was it? 

Ok, so then, what's the next thing I want to do, if I'm loading a game? 

I want to pull in the YAML data....

Ok, then, now that I've got this all done up...what do I want to do? 

Alright, so I can load a file and determine what the solution will be...when starting brand new....

Now what else do I need to do? 

I need to be able to save a game, and take the solution that exists and push it to a file....

Ok, I htink I've juiced up enough....

Let's dig into it. 

Where did I leave off yesterday? 

Ok, so I can do whatever I want, but I'm pretty sure I've been working on the "save" function....so where am I now? 

Well, I like the idea of being able to simply type "save" instead of a letter...I think that's an option available to me. 

So then, where is the prompt for getting a letter? Where is it running, and what's causing this error, an dhow do I isolate the  error causing code? 

Alright, so I isolated the error...but what else? 

So I'm doing a lot of guessing in the code, and it's not really helpful. 

If anything, it's wasteful. 

So then I need to think about what I really want to achieve next. 

So, when I type "save" during the `#take_a_turn` method...

So, when I "save" a game....I want to take the `@solution` or the `Solution` object, and I want to serialize it to `yaml`....

So, my biggest stumbling block at the moment is knowning what to name the track. Like, i don't really want to have to do MORE validation of user input. So I feel like the idea of just serializing it with the date, or pieces of the date, is a good idea...

like the month day year. But that requries I get comfortable, or at least know how to tease those values out of a `Date` object...

Ok, so now I can create files and add dates to the files that are YAML files. So that's dope. 

What's next? 

Now I need to write somethign to the file...

Ok, so now I've written the `Solution` object to the file, upon saving. 

Next thing is to load the game. 

Or do I want to write more to the file? 

I mean, i feel like I could.....

What else would I need to write to the game? What objects? 

I mean...I think what I want to do...is create some limitations to what I'm attempting to do....I want to reel in my own creativity now...because I'm certainly growing at a break-neck pace..and if I limit myself, then I know that I'm limiting myself, and i'll be totally okay with it. 

So I'm going to do that. I'm going to limit my own creation here....

Ok, so now I've serialized a lot more than just the solution. 

so then, how am I loading the `@solution` when I load the game? 

Well, that really built steam quickly. LOL. 

I ended up figuring out how to load multiple classes/objects from a `YAML` file...just like that....and then I learned how to do everything I was expecting to. 

Now, is the file the cleanest it can be? 

Not necessarily. How could I clean it up? I suppose I could write tests for it? I mean, that would definitely make me spend more time with the program. And since I don't necessarily need to finish it right now, I could definitely add it to the list of finished products, and then go from there.....Why not...

Wow, I do this so rarely, I actually have to go through the process of figuring out how to create a pull request....

Alright, so where to go...

Well, I've uploaded my thing. 

time to write some tests? 

I think so....

I mean, now that I know what the `Solution` object is supposed to be, and do...writing the tests that are necessary for it are really simple. As far as I can tell...

I mean, there aren't a lot of tests that I really need for it. 

It's supposed to be a word......but currently, it's only producing an Array...both the `@value` and the `@obscured` methods are creating Arrays....and it'd be pretty easy to re-factor this to create Strings. 

Because...where in the code is the solution being converted to `String` objects? 

Well, the only place I'm actually converting the solution into a `String` is when the game is lost..and I don't know that it's really necessary to convert it to a `String` in the `Solution` object....but what about the `@obscured` call? 

No, that's not necessary. I thought that'd be a cheap way to do some quick re-factoring...but nope. That's not really necessary. 

So next....

## `Board` class
The `Board` class is the next difficult object, but still not that challenging. 

So the first thing I want to do is see what existing tests I have for it. 

Ok, so I've written several tests for the `Board` class, and I feel like I've completely written everything I need to for the `Board` class, aside from testing of the `#update_dude` method...but I'm not really sure I know how or need to. 

I don't even know if that's a method that needs to be on the `Board`. I mean, I feel like that might be more something for the `Game` to do....but for now I'll leave it the way it is. 

## the `Game` class
I feel like this class holds the greatest amount of potential for re-factoring. Because right now, I feel like it's a little sloppy. So, I'll go over it little by little. 

The first thing I'd really like to do...is re-locate the `Dictionary.txt` file...and I don't know why. 

I mean, I feel like, what I wnat to do is relocate the dictionary to the main directory.....but I currently have the REPL setup to use this....but what would it take to update this? 

I'd have to: 

1. Move the dictionary
2. Update the `.replit` file
3. Update the `readme`
4. Update the link in `TOP`...

I'm not really going to make any changes to the "TOP" project, until my initial PRs are accepted. Then I'd look into it. But the way I see it, there's like, at least 2 months of pull requests waiting to be merged into the project. Like, what the hell? 

But Robert's stuff was pulled in. So I should be able to do the same. 

Um, so, yeah, push through these last few tests, so I can go ahead and move on to the next section. 

Ok, so I feel like I'm doing two layers of validation with the 