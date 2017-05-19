# tdd-objc-dependency-injection

This guide aims to introduce basic concepts about dependency injection, and how it relates to easier to maintain/understood code.  Here's a high level breakdown of what's covered in this guide,

1. **Thinking in terms of input/ouput, and using tests to identify code smells.**  `DataHandler` shows an example where there is an unneeded dependency, and `FeatureXCoachMarkPolicy` shows an example where there are hidden dependencies.
2. **Getting a grap on how test contamination erodes confidence.**  This is illustrated by non-deterministic tests caused by hidden dependencies.
3. **Using dependency injection to write clear, well-understood, robust code.**  Exampes of constructor injection, property injection are provided.  `DataService` also shows an example of how to proceed when global state is unavoidable.

These are points you should keep in mind as you work through the examples.

- [Setting Up](#setting-up)
- [A Few Notes](#a-few-notes)
- [Example 1:  `DataHandler`](#example-1-datahandler)
- [Example 2:  `FeatureXCoachMarkPolicy`](#example-2-featurexcoachmarkpolicy)
- [Example 3:  `DataService`](#example-3-dataservice)
- [About This TDD Series](#about-this-tdd-series)

## Setting Up

1. `pod install`, if you don't have cocoapods, try `$ sudo gem install cocoapods` or visit the [CocoaPods getting started site](https://guides.cocoapods.org/using/getting-started.html)
2. open `tddObjcDepInjection.xcworkspace`
3. Hit `⌘`+`U` to run the tests.  You should see something like,
```
Finished in 0.0052 seconds

0 examples, 0 failures
Test Suite 'All tests' passed at 2017-05-19 11:15:06.507.
	 Executed 0 tests, with 0 failures (0 unexpected) in 0.000 (0.025) seconds
```

and voila!  You're good to go!

## A Few Notes

- When working through the examples, you can exclude a test by attaching a `x` in front of a `describe`, `context`, or `it`.
- To focus on running specific tests, attach a `f` in front.

## Example #1: `DataHandler`

`DataHandler` provides a simple data handler method that returns an error if the supplied data is `nil`. 

1. Open `DataHandlerSpec` and remove `x` from the first set of tests.
2. Hit `⌘`+`U` to run the tests.  Notice that the 2nd assertion fails.
3. Take a look at the code, is there anything wrong?
4. Switch the order of two `it`'s and run tests again.  Notice that tests not pass.

wait...**What's going on?**

- Why did this happen?
- What's the code smell?
- What do these tests tell us about our code design?  (stateful + mutable) vs. (functional + immutable)


- Try running the other tests in the spec, what do you notice?

## Example #2: `FeatureXCoachMarkPolicy`

You've probably seen a feature coachmark before.  It's usually an overlay or dummy UI that serves to help users discover features in the app.  `FeatureXCoachMarkPolicy` is a policy object that determines when the coachmark should show up.

1. Reset your iPhone simulator
2. Open `FeatureXCoachMarkPolicySpec` and remove `x` from the first set of tests.
3. Run the tests.  Notice that all tests pass.
4. Run the tests again.  Notice that the first test fails.
5. Play around a bit, try repeating the steps, and try running tests multiple times.

...**huh?**

- Why did this happen?
- Is the code incorrect?  If not, what's the issue?
- What would happen if this project was connectd to CI?
- What tends to happen to tests that behave this way?


- Imagine an opposite case such as a "rate app" feature where instead hide-upon-interaction, the behaviour is to show-upon-interaction.
	- How would CI be affected?
	- How confident would you be in the tests?


## Example #3: `DataService`

`DataService` is part of a common app architecture where a service aggregates either network or cached data for multiple API's and returns it for consumption by the presentation layer.

1. Remove the `x` from all tests in this file.
2. Run the tests.  Notice that they all pass.
3. Compare the 3 sets of tests,
	- How do the `beforeEach` sections differ?
	- Which one do you find easiest to understand?
4. Try directly returning `NO` for the method `lastUpdateLessThan5DaysAgo`, which tests fail?  What does this say about the first set of tests?

## About This TDD Series

This guide is part of a growing 5 part series on TDD.

**PART I.**  Pairing, TDD/BDD, Red/Green Refactor ([ObjC-C repo](https://github.com/connected-swu/tdd-objc-barebone), [Swift repo](https://github.com/connected-swu/tdd-swift-barebone))
> - Introduction to BDD (ObjC)
> - Ping pinging (ObjC)
> - Red green refactor (ObjC)
> - Introduction to BDD in Swift (Swift)


**PART II.**  Dependency Injection, Fakes, Mocks, and Real Instances ([Obj-C repo](https://github.com/connected-swu/tdd-objc-dependency-injection), Swift to come)
> - **Test contamination, state, scope, and singletons (ObjC)**
> - Dependency injection in Swift (Swift)
> - Fakes, mocks, and real instances, when and where? (ObjC)
> - No-fakes; making mocks yourself (Swift)

**PART III.**  Testing Asynchronous Behaviour

**PART IV.**  Testing UI with Unit Tests

**PART V.**  UI Testing



