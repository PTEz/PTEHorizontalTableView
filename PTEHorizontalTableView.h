//
//  PTEHorizontalTableView.h
//  PTEHorizontalTableView
//
//  Created by Ernesto Rivera on 8/12/14.
//  Copyright (c) 2014 PTEz.
//  Inspired by EasyTableView by Aleksey Novicov.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <UIKit/UIKit.h>

@class PTEHorizontalTableView;

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


@interface PTEHorizontalTableView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet id<PTETableViewDelegate> delegate;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic) CGFloat rowWidth;
@property (nonatomic, readonly) CGSize contentSize;
@property (nonatomic) CGPoint contentOffset;
- (void)setContentOffset:(CGPoint)offset
                animated:(BOOL)animated;

@end

