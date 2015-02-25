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

- (void)moveFrameByX:(CGFloat)x
{
    self.frame = CGRectMake(self.frame.origin.x + x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)moveFrameByY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + y, self.frame.size.width, self.frame.size.height);
}

- (void)moveFrameToX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)moveFrameToY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)moveFrameInFrontOf:(CGRect)frame withMargin:(CGFloat)margin
{
    [self moveFrameToX:frame.origin.x - margin - self.frame.size.width];
}

- (void)moveFrameNextTo:(CGRect)frame withMargin:(CGFloat)margin
{
    [self moveFrameToX:frame.origin.x + frame.size.width + margin];
}

- (void)moveFrameAbove:(CGRect)frame withMargin:(CGFloat)margin
{
    [self moveFrameToY:frame.origin.y - margin - self.frame.size.height];
}

- (void)moveFrameUnder:(CGRect)frame withMargin:(CGFloat)margin
{
    [self moveFrameToY:frame.origin.y + frame.size.height + margin];
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

- (void)changeFrameWidthBy:(CGFloat)points
{
    [self setFrameSize:CGSizeMake(self.frame.size.width + points, self.frame.size.height)];
}

- (void)changeFrameHeightBy:(CGFloat)points
{
    [self setFrameSize:CGSizeMake(self.frame.size.width, self.frame.size.height + points)];
}


#pragma mark - Frame alignments

- (void)alignLeftOf:(CGRect)frame
{
    [self moveFrameToX:frame.origin.x];
}

- (void)alignCenterOf:(CGRect)frame
{
    CGFloat centerX = frame.origin.x + (frame.size.width / 2.0f);
    [self moveFrameToX:centerX - (self.frame.size.width / 2.0f)];
}

- (void)alignRightOf:(CGRect)frame
{
    [self moveFrameToX:frame.origin.x + frame.size.width - self.frame.size.width];
}

- (void)alignLeftOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat left = frame.origin.x;
    for (int i = 0; i < index; i++) {
        left += [(UIView *)views[i] frame].size.width;
    }
    
    self.left = left;
}

- (void)alignCenterOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat indexWidth = 0;
    CGFloat framesWidth = 0;
    int i = 0;
    
    for (UIView *view in views) {
        framesWidth += view.frame.size.width;
        
        if (i < index) {
            indexWidth += view.frame.size.width;
        }
        
        i++;
    }
    
    CGFloat centerX = frame.origin.x + (frame.size.width / 2.0f);
    [self moveFrameToX:centerX - (framesWidth/2.0f) + indexWidth];
}

- (void)alignRightOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat indexWidth = 0;
    for (int i = 0; i < index; i++) {
        indexWidth += [(UIView *)views[i] frame].size.width;
    }
    
    [self moveFrameToX:frame.origin.x + frame.size.width - indexWidth - self.width];
}

#pragma mark - Frame vertical alignments

- (void)verticalAlignTopOf:(CGRect)frame
{
    [self moveFrameToY:frame.origin.y];
}

- (void)verticalAlignCenterOf:(CGRect)frame
{
    CGFloat centerY = frame.origin.y + (frame.size.height / 2.0f);
    [self moveFrameToY:centerY - (self.frame.size.height/2.0f)];
}

- (void)verticalAlignBottomOf:(CGRect)frame
{
    CGFloat bottomY = frame.origin.y + frame.size.height;
    [self moveFrameToY:(bottomY - self.frame.size.height)];
}

- (void)verticalAlignTopOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat indexHeight = 0;
    for (int i = 0; i < index; i++) {
        indexHeight += [(UIView *)views[i] frame].size.height;
    }
    
    [self moveFrameToY:frame.origin.y + indexHeight];
}

- (void)verticalAlignCenterOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat indexHeight = 0;
    CGFloat framesHeight = 0;
    int i = 0;
    
    for (UIView *view in views) {
        framesHeight += view.frame.size.height;
        
        if (i < index) {
            indexHeight += view.frame.size.height;
        }
        
        i++;
    }
    
    CGFloat centerY = frame.origin.y + (frame.size.height / 2.0f);
    [self moveFrameToY:centerY - (framesHeight/2.0f) + indexHeight];
}

- (void)verticalAlignBottomOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views
{
    NSAssert(index < views.count, kAssertFrameIndex);
    
    CGFloat indexHeight = 0;
    for (int i = 0; i < index; i++) {
        indexHeight += [(UIView *)views[i] frame].size.height;
    }
    
    [self moveFrameToY:frame.origin.y + frame.size.height - indexHeight - self.frame.size.height];
}

#pragma mark - Class methods for views

#pragma mark - Horizontal alignment

#pragma mark Left

+ (void)alignViewsLeftOf:(CGRect)frame views:(NSArray *)views leftMargin:(CGFloat)leftMargin
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return frame.origin.x + leftMargin;
    }];
}

+ (void)alignViewsLeftOf:(CGRect)frame views:(NSArray *)views
{
    [UIView alignViewsLeftOf:frame views:views leftMargin:0];
}

#pragma mark Center

+ (void)alignViewsCenterOf:(CGRect)frame views:(NSArray *)views
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return (frame.size.width / 2.0f) - (width / 2.0f);
    }];
}

#pragma mark Right

+ (void)alignViewsRightOf:(CGRect)frame views:(NSArray *)views rightMargin:(CGFloat)rightMargin
{
    [UIView positionViewsTo:frame views:views left:^CGFloat(CGFloat width) {
        return (frame.origin.x + frame.size.width) - width - rightMargin;
    }];
}

+ (void)alignViewsRightOf:(CGRect)frame views:(NSArray *)views
{
    [UIView alignViewsRightOf:frame views:views rightMargin:0];
}

#pragma mark - Vertical alignment

#pragma mark Top

+ (void)verticalAlignViewsTopOf:(CGRect)frame views:(NSArray *)views topMargin:(CGFloat)topMargin
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.origin.y + topMargin);
    }];
}

+ (void)verticalAlignViewsTopOf:(CGRect)frame views:(NSArray *)views
{
    [UIView verticalAlignViewsTopOf:frame views:views topMargin:0];
}

#pragma mark Center

+ (void)verticalAlignViewsCenterOf:(CGRect)frame views:(NSArray *)views
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.size.height / 2.0f) - (height / 2.0f);
    }];
}

#pragma mark Bottom

+ (void)verticalAlignViewsBottomOf:(CGRect)frame views:(NSArray *)views bottomMargin:(CGFloat)bottomMargin
{
    [UIView positionViewsTo:frame views:views top:^CGFloat(CGFloat height) {
        return (frame.origin.y + frame.size.height) - height - bottomMargin;
    }];
}

+ (void)verticalAlignViewsBottomOf:(CGRect)frame views:(NSArray *)views
{
    [UIView verticalAlignViewsBottomOf:frame views:views bottomMargin:0];
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
