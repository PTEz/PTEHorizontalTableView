//
//  PTEHorizontalTableView.m
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

#import <QuartzCore/QuartzCore.h>
#import "PTEHorizontalTableView.h"

@implementation PTEHorizontalTableView

@dynamic rowWidth;
@dynamic contentSize;
@dynamic contentOffset;

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    
    [self refreshOrientation];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask	= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_tableView];
}

- (void)setFrame:(CGRect)frame
{
    super.frame = frame;
    
    [self refreshOrientation];
}

- (void)refreshOrientation
{
    if (!self.tableView)
        return;
    
    // First reset rotation
    self.tableView.transform = CGAffineTransformIdentity;
    self.tableView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    // Adjust frame
    int xOrigin	= (self.bounds.size.width - self.bounds.size.height) / 2.0;
    int yOrigin	= (self.bounds.size.height - self.bounds.size.width) / 2.0;
    self.tableView.frame = CGRectMake(xOrigin, yOrigin, self.bounds.size.height, self.bounds.size.width);
    
    // Apply rotation again
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, self.bounds.size.height - 7.0);
}

- (CGPoint)contentOffset
{
    CGPoint offset = self.tableView.contentOffset;
    return CGPointMake(offset.y, offset.x);
}

- (void)setContentOffset:(CGPoint)offset
{
	[self setContentOffset:offset
                  animated:NO];
}

- (void)setContentOffset:(CGPoint)offset
                animated:(BOOL)animated
{
	[self.tableView setContentOffset:CGPointMake(offset.y, offset.x)
                            animated:animated];
}

- (CGSize)contentSize
{
    CGSize size = self.tableView.contentSize;
    return CGSizeMake(size.height, size.width);
}

- (CGFloat)rowWidth
{
    return self.tableView.rowHeight;
}

- (void)setRowWidth:(CGFloat)rowWidth
{
    self.tableView.rowHeight = rowWidth;
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
        UIView *headerView = [self.delegate tableView:self viewForHeaderInSection:section];
        return headerView.frame.size.width;
    }
    return 0.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)])
    {
        UIView *footerView = [self.delegate tableView:self viewForFooterInSection:section];
        return footerView.frame.size.width;
    }
    return 0.0;
}

- (UIView *)viewToHoldSectionView:(UIView *)sectionView
{
    // Enforce proper section header/footer view height and origin. This is required because
    // of the way UITableView resizes section views on orientation changes.
    sectionView.frame = CGRectMake(0, 0, sectionView.frame.size.width, self.frame.size.height);
    
    UIView *rotatedView = [[UIView alloc] initWithFrame:sectionView.frame];
    
    rotatedView.transform = CGAffineTransformMakeRotation(M_PI/2);
    sectionView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [rotatedView addSubview:sectionView];
    return rotatedView;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
		UIView *sectionView = [self.delegate tableView:self viewForHeaderInSection:section];
		return [self viewToHoldSectionView:sectionView];
    }
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)])
    {
		UIView *sectionView = [self.delegate tableView:self viewForFooterInSection:section];
		return [self viewToHoldSectionView:sectionView];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
    {
        [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:widthForCellAtIndexPath:)])
    {
        return [self.delegate tableView:self widthForCellAtIndexPath:indexPath];
    }
    return tableView.rowHeight;
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.delegate respondsToSelector:@selector(numberOfSectionsInTableView:)])
    {
        return [self.delegate numberOfSectionsInTableView:self];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.delegate tableView:self numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.delegate tableView:self cellForRowAtIndexPath:indexPath];
    
    // Rotate if needed
    if (CGAffineTransformEqualToTransform(cell.contentView.transform, CGAffineTransformIdentity))
    {
        int xOrigin	= (cell.bounds.size.width - cell.bounds.size.height) / 2.0;
        int yOrigin	= (cell.bounds.size.height - cell.bounds.size.width) / 2.0;
        cell.contentView.frame = CGRectMake(xOrigin, yOrigin, cell.bounds.size.height, cell.bounds.size.width);
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI/2.0);
    }
    return cell;
}

@end

