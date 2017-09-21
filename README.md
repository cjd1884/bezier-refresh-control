# Bezier Refresh Control
> A vector-based (using bezier paths) animated loading control (pull-to-refresh) for iOS scroll views (to be used in table & collection views).

[![Version](https://img.shields.io/cocoapods/v/BezierRefreshControl.svg?style=flat)](http://cocoapods.org/pods/BezierRefreshControl)
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![CI Status](http://img.shields.io/travis/cjd1884/BezierRefreshControl.svg?style=flat)](https://travis-ci.org/cjd1884/bezier-refresh-control)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

BezierRefreshControl implements an animated way of drawing bezier paths to be used as a loading control in iOS scroll views - like in case of refreshing the content of a table view (or collection view) - pull-to-refresh action. Developer can provide its own bezier path at the initialisation phase of the control to be animated. The animation executes while data is loading (e.g. fetching data from a remote source/API).

![FlameRefreshControl](https://media.giphy.com/media/TaOFG4SYsQa76/giphy.gif)

## Features

- [x] Custom bezier paths support
- [x] Working in every UIScrollView subclass
- [x] Color customisation
- [x] Stroke line width customisation

## Requirements

- iOS 8.0+
- Xcode 7.3

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `BezierRefreshControl` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'BezierRefreshControl'
```

To get the full benefits import `BezierRefreshControl` wherever you import UIKit

``` swift
import UIKit
import BezierRefreshControl
```

#### Manually
1. Download and drop ```BezierRefreshControl.swift``` in your project.  
2. Congratulations!  

## Usage example

Do the import :
```swift
import BezierRefreshControl
```
Create a property in your class:
```swift
var refreshControl: BezierRefreshControl!
```

In your ```viewDidLoad()``` method add these:
```swift
// Init BezierRefreshControl
self.refreshControl = BezierRefreshControl(inScrollView: self.tableView, withPath: createSampleFlamePath(), bindsScrollViewDelegate: true)

// Set the delegate
self.refreshControl.delegate = self
```

> Notice that you need to provide your ```UIBezierPath``` instance as an initialisation argument.
## Properties

Color:
```swift
self.refreshControl.color = UIColor.red
```
Stroke line width:
```swift
self.refreshControl.lineWidth = 3.0
```


## UIScrollViewDelegate binding

If you noticed at the initialisation phase there is a boolean argument about binding the scroll view delegate. In case you need to implement the scroll view delegate in your code you need to do these two steps:
1. At the initialisation phase, set ```bindsScrollViewDelegate``` argument to ```false```
2. Inside the implemented (in your code) delegate methods of ```UIScrollViewDelegate```, call the control's publicly exposed methods:
```swift
func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
self.refreshControl.scrollViewWillBeginDragging(scrollView)
}

func scrollViewDidScroll(_ scrollView: UIScrollView) {
self.refreshControl.scrollViewDidScroll(scrollView)
}

func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
self.refreshControl.scrollViewDidEndDragging(scrollView, willDecelerate: decelerate)
}
```

## Contribute

We would love you for the contribution to **BezierRefreshControl**, check the ``LICENSE`` file for more info.

## Meta

Konstantinos Dimitros – [@cjd1884](https://twitter.com/cjd1884) – k.dimitros@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/cjd1884/bezier-refresh-control](https://github.com/cjd1884/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://opensource.org/licenses/MIT
