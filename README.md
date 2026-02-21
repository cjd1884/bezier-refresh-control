# Bezier Refresh Control
> A vector-based (using bezier paths) animated loading control (pull-to-refresh) for iOS scroll views (to be used in table & collection views).

[![Swift Version][swift-image]][swift-url]
[![CocoaPods Compatible][pod-image]][pod-url]
[![Build Status][build-image]][build-url]
[![PRs Welcome][pr-image]][pr-url]
[![License][license-image]][license-url]

BezierRefreshControl implements an animated way of drawing bezier paths to be used as a loading control in iOS scroll views - like in case of refreshing the content of a table view (or collection view) - pull-to-refresh action. Developer can provide its own bezier path at the initialisation phase of the control to be animated. The animation executes while data is loading (e.g. fetching data from a remote source/API).

![FlameRefreshControl](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExODcybDNjOGVvajJ5NWt0a2piZnJkbXhrN2NlczBpZGN1azRrOWI1NSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YogL4S4Udez8Ti1KxZ/giphy.gif)

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

I would love your contribution to **BezierRefreshControl**, check the ``LICENSE`` file for more info.

## About Me

Konstantinos Dimitros |
[twitter](https://twitter.com/cjd1884) |
[email](k.dimitros@gmail.com) |
[github](https://github.com/cjd1884/) |
[linkedin](https://www.linkedin.com/in/konstantinos-dimitros-49105522/)

## License
Distributed under the MIT license. See ``LICENSE`` for more information.


[pod-image]: https://img.shields.io/cocoapods/v/BezierRefreshControl.svg?style=flat
[pod-url]: http://cocoapods.org/pods/BezierRefreshControl
[swift-image]: https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[build-image]: https://travis-ci.org/cjd1884/bezier-refresh-control.svg?branch=master
[build-url]: https://travis-ci.org/cjd1884/bezier-refresh-control
[pr-image]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[pr-url]: http://makeapullrequest.com
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://opensource.org/licenses/MIT
