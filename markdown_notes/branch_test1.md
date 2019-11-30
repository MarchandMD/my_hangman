# branch test1
Ok, I'm going to begin creating branches; I hope this'll help me.

this branch is devoted to keeping all other things constant, and developing the `#reveal` method. No matter how complicated it might get. 

Now, if I build a method via RSpec, I'll want to see it in action. 

And how would I see a method in action, without running through an entire cycle of the program? 

I could always jump into PRY or IRB...and try it there...

ok...

so I can pass the `Solution#reveal` method a letter, and it'll populate the `@obscured` instance variable...but not completely. 

So I feel like this method is ok...but there is some additional things that need to happen, and I think this is more a logic thing. 

Ok, so what I need to do is...

Start putting myself on a timer...becuase I'm giving all my time to this...and I need to have some balance...


so I need to somehow search the `solution.value` for ALL occurances of the `solution.value.index(letter)`. 

But that's not easy. 

I need to search the `solution.value` for the index value of the elements that match the parameter. 

So, that's sort of an `Array` method? maybe..

ok, so here's what I did: 

```ruby
solution.value.each_with_index do |x, i|
  if x == "A"
    puts i
  end
end
```

... and this went through the `Array` and it returned both index values. 

Now, I want to take those numbers, and I want to do something with them. 

So, can I pass those values to something else? 

Of course I can....

Ok, now I have an array: 

```ruby
[1,5]
```

and what I need to do is, I need to take each element and multiply it by 2 (for now)...

Ok, now I have an array that has the positions that I need to populate the `solution.obscured` with...

So how do I take each element from the return of `#testing` and use it to populate another object? 

I mean, it's just taking a longer and longer route to get to the answer I need...but I don't know how else to do it...and it's getting more and more complicated....So...And I don't really know what it is that I'm doing. 

I'm wanting to create a simple method...but it keeps getting bigger and bigger. 

I mean...it just gets more and more complicated....

So......I mean, what am I looking at? And what do I continue to look at? 

I'm trying to change the `@obscured` instance variable. 

Is that the thing to change? I don't know if I know how to do this....

take a letter, and compare it to every element in the solution. 

if they are the same....I mean...I think I want to do something different. I feel like this method is getting very complicated, and it seems strange. 

But this is like, this is part of the process. Finding an issue, and then bringing a solution to it. 

So, since there are a lot of problems, I want to think about what the objects are, that I start with. 

And I want to think about what I begin with, and what I want to end with. And then walk the two points together. 

So then, I want to switch branches. 

Ok, I don't need this branch...what I needed to do was much simpler than I realized. 

And it clicked for me when I looked at the objects I was strating with, and the output I wanted to achieve. 

So, i'm going to end this file here, and go back to the other notes, because I just solved the issue I was experiencing with this branch.   
  