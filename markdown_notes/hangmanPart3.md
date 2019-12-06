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