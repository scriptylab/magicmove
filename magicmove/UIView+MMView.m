//
//  UIView+MMView.m
//  magicmove
//
//  Created by Stanislav Musil on 2/21/15.
//  Copyright (c) 2015 scriptylab. All rights reserved.
//

#import "UIView+MMView.h"

NSString *const kAssertFrameIndex = @"Frame index cannot be greater than count of views!";
NSString *const kAssertViewsCount = @"Count of views must be higher than one!";

@implementation UIView (MMView)

#pragma mark - Properties

#pragma mark Width
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

#pragma mark Height
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

#pragma mark Left
- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

#pragma mark Right
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.width;
    self.frame = frame;
}

- (CGFloat)right
{
    return (self.left + self.width);
}

#pragma mark Top
- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

#pragma mark Bottom
- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.height;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return (self.top + self.height);
}

#pragma mark - Frame movement

- (void)moveInFrontOf:(CGRect)frame withMargin:(CGFloat)margin
{
    self.left = frame.origin.x - margin - self.frame.size.width;
}

- (void)moveInFrontOf:(CGRect)frame
{
    [self moveInFrontOf:frame withMargin:0];
}

- (void)moveNextTo:(CGRect)frame withMargin:(CGFloat)margin
{
    self.left = frame.origin.x + frame.size.width + margin;
}

- (void)moveNextTo:(CGRect)frame
{
    [self moveNextTo:frame withMargin:0];
}

- (void)moveAbove:(CGRect)frame withMargin:(CGFloat)margin
{
    self.top = frame.origin.y - margin - self.frame.size.height;
}

- (void)moveAbove:(CGRect)frame
{
    [self moveAbove:frame withMargin:0];
}

- (void)moveUnder:(CGRect)frame withMargin:(CGFloat)margin
{
    self.top = frame.origin.y + frame.size.height + margin;
}

- (void)moveUnder:(CGRect)frame
{
    [self moveUnder:frame withMargin:0];
}

#pragma mark - Frame modifications

- (void)setFrameOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameSize:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

#pragma mark - Frame alignments

- (void)leftOf:(CGRect)frame
{
    self.left = frame.origin.x;
}

- (void)centerOf:(CGRect)frame
{
    CGFloat centerX = frame.origin.x + (frame.size.width / 2.0f);
    self.left = centerX - (self.frame.size.width / 2.0f);
}

- (void)rightOf:(CGRect)frame
{
    self.left = frame.origin.x + frame.size.width - self.frame.size.width;
}

#pragma mark - Frame vertical alignments

- (void)topOf:(CGRect)frame
{
    self.top = frame.origin.y;
}

- (void)middleOf:(CGRect)frame
{
    CGFloat centerY = frame.origin.y + (frame.size.height / 2.0f);
    self.top = centerY - (self.frame.size.height/2.0f);
}

- (void)bottomOf:(CGRect)frame
{
    CGFloat bottomY = frame.origin.y + frame.size.height;
    self.top = (bottomY - self.frame.size.height);
}

#pragma mark - Class methods for views

#pragma mark - Horizontal alignment

#pragma mark Left

+ (void)viewsLeftOf:(CGRect)frame views:(NSArray *)views leftMargin:(CGFloat)leftMargin
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return frame.origin.x + leftMargin;
    }];
}

+ (void)viewsLeftOf:(CGRect)frame views:(NSArray *)views
{
    [UIView viewsLeftOf:frame views:views leftMargin:0];
}

#pragma mark Center

+ (void)viewsCenterOf:(CGRect)frame views:(NSArray *)views
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return (frame.size.width / 2.0f) - (width / 2.0f);
    }];
}

#pragma mark Right

+ (void)viewsRightOf:(CGRect)frame views:(NSArray *)views rightMargin:(CGFloat)rightMargin
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return (frame.origin.x + frame.size.width) - width - rightMargin;
    }];
}

+ (void)viewsRightOf:(CGRect)frame views:(NSArray *)views
{
    [UIView viewsRightOf:frame views:views rightMargin:0];
}

#pragma mark - Vertical alignment

#pragma mark Top

+ (void)viewsTopOf:(CGRect)frame views:(NSArray *)views topMargin:(CGFloat)topMargin
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.origin.y + topMargin);
    }];
}

+ (void)viewsTopOf:(CGRect)frame views:(NSArray *)views
{
    [UIView viewsTopOf:frame views:views topMargin:0];
}

#pragma mark Center

+ (void)viewsMiddleOf:(CGRect)frame views:(NSArray *)views
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.size.height / 2.0f) - (height / 2.0f);
    }];
}

#pragma mark Bottom

+ (void)viewsBottomOf:(CGRect)frame views:(NSArray *)views bottomMargin:(CGFloat)bottomMargin
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.origin.y + frame.size.height) - height - bottomMargin;
    }];
}

+ (void)viewsBottomOf:(CGRect)frame views:(NSArray *)views
{
    [UIView viewsBottomOf:frame views:views bottomMargin:0];
}

#pragma mark - Private methods

+ (void)positionViewsTo:(CGRect)frame views:(NSArray *)views left:(CGFloat (^)(CGFloat width))leftBlock top:(CGFloat (^)(CGFloat height))topBlock
{
    NSAssert(views && views.count > 1, kAssertViewsCount);
    
    CGFloat minX = MAXFLOAT;
    CGFloat maxX = 0;
    CGFloat minY = MAXFLOAT;
    CGFloat maxY = 0;

    for (UIView *view in views) {
        if (view.top < minY) minY = view.top;
        if (view.bottom > maxY) maxY = view.bottom;
        if (view.left < minX) minX = view.left;
        if (view.right > maxX) maxX = view.right;
    }
    
    CGFloat width = (maxX - minX);
    CGFloat height = (maxY - minY);
    
    CGFloat top = topBlock ? topBlock(height) : -1;
    CGFloat left = leftBlock ? leftBlock(width) : -1;
    
    for (NSInteger i = 0; i < views.count; i++) {
        UIView *view = views[i];
        
        if (left != -1) {
            view.left = view.left - minX + left;
        }
        
        if (top != -1) {
            view.top = view.top - minY + top;
        }
    }
}

+ (void)positionViewsTo:(CGRect)frame views:(NSArray *)views left:(CGFloat (^)(CGFloat width))leftBlock {
    [UIView positionViewsTo:frame views:views left:leftBlock top:nil];
}

+ (void)positionViewsTo:(CGRect)frame views:(NSArray *)views top:(CGFloat (^)(CGFloat height))topBlock {
    [UIView positionViewsTo:frame views:views left:nil top:topBlock];
}

@end
