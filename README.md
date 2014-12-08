
PTEHorizontalTableView
======================

[![Platform: iOS](https://img.shields.io/cocoapods/p/PTEHorizontalTableView.svg?style=flat)](http://cocoadocs.org/docsets/PTEHorizontalTableView/)
[![Version: 1.0.0](https://img.shields.io/cocoapods/v/PTEHorizontalTableView.svg?style=flat)](http://cocoadocs.org/docsets/PTEHorizontalTableView/)
[![License: Apache 2.0](https://img.shields.io/cocoapods/l/PTEHorizontalTableView.svg?style=flat)](http://cocoadocs.org/docsets/PTEHorizontalTableView/)
[![Dependency Status](https://www.versioneye.com/objective-c/PTEHorizontalTableView/badge.svg?style=flat)](https://www.versioneye.com/objective-c/PTEHorizontalTableView)
[![Build Status](http://img.shields.io/travis/PTEz/PTEHorizontalTableView/master.svg?style=flat)](https://travis-ci.org/PTEz/PTEHorizontalTableView)

Horizontal UITableView inspired by [EasyTableView](https://github.com/alekseyn/EasyTableView).

![Screenshot 1](http://ptez.github.io/PTEHorizontalTableView/images/screenshot1.png)　![Screenshot 2](http://ptez.github.io/PTEHorizontalTableView/images/screenshot2.png)

## Features

* PTEHorizontalTableView wraps a `UITableView` rotated horizontally using a `CGAffineTransform` whose cells' content views are rotated back vertically.
* `PTETableViewDelegate` very similar to the standard `UITableViewDelegate` with some method name such as `tableView:widthForCellAtIndexPath:`.
* Support for standard scroll indicators, headers and footers.
* Full Interface Builder support including creating Static/Prototype Cells using Storyboards.

## Demo

A demo project is [included](Demo) in the repository.

## Installation

Simply add `pod 'PTEHorizontalTableView'` to your [CocoaPods](http://cocoapods.org)' [Podfile](http://guides.cocoapods.org/syntax/podfile.html).

```ruby
platform :ios, '5.0'

pod 'PTEHorizontalTableView'
```

## Documentation

http://cocoadocs.org/docsets/PTEHorizontalTableView/

## Usage

Simply implement the `PTETableViewDelegate` protocol:

```obj-c
@protocol PTETableViewDelegate <NSObject>

- (NSInteger)tableView:(PTEHorizontalTableView *)horizontalTableView
numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(PTEHorizontalTableView *)horizontalTableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSUInteger)numberOfSectionsInTableView:(PTEHorizontalTableView*)horizontalTableView;

- (void)tableView:(PTEHorizontalTableView *)horizontalTableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (UIView*)tableView:(PTEHorizontalTableView*)horizontalTableView
viewForHeaderInSection:(NSInteger)section;

- (UIView*)tableView:(PTEHorizontalTableView*)horizontalTableView
viewForFooterInSection:(NSInteger)section;

- (CGFloat)tableView:(PTEHorizontalTableView *)horizontalTableView
widthForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

```

## License

Copyright 2014 Ernesto Rivera

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

