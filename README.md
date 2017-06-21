# Melinda's Backpack
Melinda is a busy entrepreneur, so when she heads out in the morning she can't leave anything behind. Her backpack holds her clothes, gym gear, and anything else she might need. Her backpack gets heavy if she brings too much stuff, so she doesn't bring unneeded items!

To keep herself organized, she wrote a short Ruby class to remind her what to bring. She tells the `Backpack` class what day of the week it is, and what the weather is like. It adds all the items she'll need, and can print out a nicely formatted packing list.

```ruby
melindas = Backpack.new(day_of_week: 'thursday', weather: 'rainy')
puts melindas.my_func
```
will print out...
```
Melinda, here's your packing list!
Day: thursday, Weather: rainy

- pants
- shirt
- umbrella
- gym shoes
- packed lunch
```
Unfortunately, as she was adding the weather feature things got a little messy. Thankfully, Melinda wrote some tests for most of the functions of the Backpack class. You can run them by doing `ruby backpack_test.rb`. Try this now.

Your mission is to refactor the Backpack class so it's easier for Melinda to change in the future!

## Code Smell 0 - Insufficient Tests
Before we can even think about Refactoring, we need to confirm we have adequate test coverage. Take a look at the `backpack_test.rb` file. Everything looks pretty good here, except... wait! The section of the `prepare` method that deals with 'gym shoes' is totally untested! Whew, good catch. Let's add some tests starting at line 46 of `backpack_test.rb` to verify gym shoes are there when needed (Mondays and Thursdays), and missing when not.

# Ready to Refactor
Remember, Each Refactoring *must* follow this process:
1. Identify a Code Smell (like Bad Name, or Long Method).
2. Run the Tests, they must pass.
3. Refactor using one of the prescribed 'Recipes'.
4. Run the Tests again. If they fail, undo your change, and make a better one.
5. Commit... if the tests passed. Pat yourself on the back. Your app just got better.

## Code Smell 1 - Bad Variable Name
Code Smell: Is there a variable in the `prepare` method that needs a better name?

Refactoring: Pick a more meaningful name, and replace all references with the new name.

## Code Smell 2 - Inaccurate Comment
Code Smell: Do all of the comments in the `prepare` method line up with the code?

Refactoring: Improve any comments that don't align with what the code really does.

## Code Smell 3 - Bad Method Name
Code Smell: Is there a method in Backpack that needs a better name?

Refactoring: Pick a more meaningful name, and replace all references with the new name. Note: In this case, *all* references may include changing a test.

## Code Smell 4 - Long Method
Code Smell: Is the `prepare` method doing too much? Is it too long to keep in your head all at once?

Refactoring: Perform the 'Extract Method' refactoring recipe.
1. Find a chunk of code that goes together, and give the concept a name.
2. Make an empty method with that name.
3. Call the method from the same place as the code you're moving.
4. Cut the code from the old location to the new method. Make sure to bring any local variable assignments with you to the new method!

Repeat Steps 1-4 until you are satisfied the `prepare` method is small enough.

## Code Smell 5 - Dead Code
Code Smell: Is there any Dead Code in the Backpack class? This is code that will never be executed.

Refactoring: Delete the Dead Code

## Code Smell 6 - Unnecessary Comments
Code Smell: Do you consider any of the comments in Backpack unnecessary? This is your judgement call about whether they add value or not.

Refactoring: Delete the Unnecessary Comment(s)

## Code Smell 7 - Duplicate Code
Code Smell: Are there conditional branches (if/elses) in the `prepare` method (or one of its subroutines) that contain duplicate code?

Refactoring: Consolidate the Conditionals. If the code is run in every if/else branch... it needn't be in the conditional at all. Pull it out!

## Stretch
- No really, these are stretch. They are meant to challenge you if the above was too easy.
1. There are still temporary variables cluttering up the `prepare` method. Apply the 'Extract Temp to Query' Refactoring on them.
2. Does the Backpack class have too much responsibility? If you consider it a Large Class, consider performing the Extract Class refactoring. Maybe pull out a 'Day' class with helpers like `.weekday?`
