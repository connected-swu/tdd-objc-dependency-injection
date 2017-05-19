# tdd-objc-dependency-injection

This guide aims to introduce basic concepts about dependency injection, and how it relates to easier to maintain/understood code.  Here's a high level breakdown of what's covered in this guide,

1. **Thinking in terms of input/ouput, and using tests to identify code smells.**  `DataHandler` shows an example where there is an unneeded dependency, and `FeatureXCoachMarkPolicy` shows an example where there are hidden dependencies.
2. **Getting a grap on how test contamination erodes confidence.**  This is illustrated by non-deterministic tests caused by hidden dependencies.
3. **Using dependency injection to write clear, well-understood, robust code.**  Exampes of constructor injection, property injection are provided.  `DataService` also shows an example of how to proceed when global state is unavoidable.

These are points you should keep in mind as you work through the examples.

- [Setting Up](#setting-up)
- [A Few Notes](#a-few-notes)
- [Example 1:  `DataHandler`](#datahandler)
- [Example 2:  `FeatureXCoachMarkPolicy`](#featurexcoachmarkpolicy)
- [Example 3:  `DataService`](#dataservice)
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

## `DataHandler`


## `FeatureXCoachMarkPolicy`


## `DataService`


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



