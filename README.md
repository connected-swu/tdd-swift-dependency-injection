# tdd-swift-dependency-injection

This guide is a continuation of [depdency injection in objc](https://github.com/connected-swu/tdd-objc-dependency-injection).  The previous guide illustrates the value of dependency injection in abstracting out reference or global state that may be (1) hard to test, and (2) prone to test contamination.  This guide focuses on providing additional hands-on exercises.

- [Setting Up](#setting-up)
- [A Few Notes](#a-few-notes)
- [DI Examples](#di-examples)
	- [Example 1:  `MyRouter`](#example-1-myrouter)
	- [Example 2:  `MyDataUpdateResponder`](#example-2-mydataupdateresponder)

## Setting Up

As always, 

1. Clone project
2. `pod install`
3. open `tddSwiftDepInjection.xcworkspace`
3. Hit `⌘`+`U` to run the tests and check that,
```
Test Suite 'All tests' passed at 2017-06-16 17:25:00.953.
	 Executed 0 tests, with 0 failures (0 unexpected) in 0.000 (0.004) seconds
```

## A Few Notes

- When working through the examples, you can exclude a test by attaching a `x` in front of a `describe`, `context`, or `it`.
- To focus on running specific tests, attach a `f` in front

Solutions to the following examples are included in `SwuMyRouterSpec.swift`, `SwuMyDataUpdateResponderSpec.swift`, and their corresponding implementation files.

## DI Examples

### Example #1: `MyRouter`

A `MyRouter` variant can be commonly in most apps - it is usually in charge of handling either incoming deep-links or outgoing redirections.

In this specific case, `MyRouter` takes a search query like `DI` and correctly sends the user to `https://www.google.ca/#q=DI`.

> **Given:**  Susan is curious about what _DI_ means.  
> **When:**  Susan supplies _DI_ search term to the router.  
> **Then:**  Susan is redirected to the google search link for _DI_.  

Open up `MyRouterSpec.swift` and start setting up your test!

### Example #2: `MyDataUpdateResponder`

`MyDataUpdateResponder` is a useful component that interfaces with legacy SDK's or API's.  Usually, to keep things clean when working with non-mobile-friendly API's or SDK's with large or fragmented data models, you'll want such a component to extract / combine / sanitize / filter / etc data into a domain specific format for your app.

For the purposes of demonstrating DI, we won't be implementing any particular business logic, but will focus on the _insulating-function_ of our class in mediating data access between the app and potential sources.  `MyDataUpdateResponder` receives a notification and publishes new data to a list of consumers.

> **Given:**  Susan wants to know when the status of an important transaction changes.  
> **When:**  New transaction data becomes available.  
> **Then:**  Susan is immediately notified of it.  
>  
> **Technical Specs:**  
> - `LegacyTransactionSDK` will post a `NSNotification` called `fresh_data` with the data as the object.
> - The data may update on multiple views, so expect multiple consumers.


**Open up `MyDataUpdateResponderSpec.swift` and start setting up your tests!**



