//
//  UIView category for view positioning
//  actions
//
//  UIView+MMView.h
//  magicmove
//
//  Created by Stanislav Musil on 2/21/15.
//  Copyright (c) 2015 scriptylab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MMView)

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;

#pragma mark - Instance methods

/**
 * Moves frame in front of the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveInFrontOf:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame in front of the given frame
 *
 * @param CGRect frame
 */
- (void)moveInFrontOf:(CGRect)frame;

/**
 * Moves frame next to the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveNextTo:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame next to the given frame
 *
 * @param CGRect frame
 */
- (void)moveNextTo:(CGRect)frame;

/**
 * Moves frame above the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveAbove:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame above the given frame
 *
 * @param CGRect frame
 */
- (void)moveAbove:(CGRect)frame;

/**
 * Moves frame under the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveUnder:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame under the given frame
 *
 * @param CGRect frame
 */
- (void)moveUnder:(CGRect)frame;

/**
 * Sets the frame origin leaving the same size
 *
 * @param CGPoint origin
 */
- (void)setFrameOrigin:(CGPoint)origin;

/**
 * Sets the frame size leaving the same origin
 *
 * @param CGSize size
 */
- (void)setFrameSize:(CGSize)size;

#pragma mark - Horizontal alignment

/**
 * Aligns to the left of the given frame
 *
 * @param CGRect frame
 */
- (void)leftOf:(CGRect)frame;

/**
 * Aligns to the center of the given frame
 *
 * @param CGRect frame
 */
- (void)centerOf:(CGRect)frame;

/**
 * Aligns to the right of the given frame
 *
 * @param CGRect frame
 */
- (void)rightOf:(CGRect)frame;

#pragma mark - Vertical alignment

/**
 * Sets vertical align to the top of the given frame
 *
 * @param CGRect frame
 */
- (void)topOf:(CGRect)frame;

/**
 * Sets vertical align to the middle of the given frame
 *
 * @param CGRect frame
 */
- (void)middleOf:(CGRect)frame;

/**
 * Sets vertical align to the bottom of the given frame
 *
 * @param CGRect frame
 */
- (void)bottomOf:(CGRect)frame;

#pragma mark - Class methods

#pragma mark - Horizontal alignment

#pragma mark Left

/**
 * Aligns the given array of views to left of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param CGFloat leftMargin - space between left boundary and first view
 */
+ (void)viewsLeftOf:(CGRect)frame views:(NSArray *)views leftMargin:(CGFloat)leftMargin;

/**
 * Aligns the given array of views to left of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsLeftOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Center

/**
 * Aligns the given array of views to center of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsCenterOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Right

/**
 * Aligns the given array of views to right of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param CGFloat rightMargin - space between right boundary and last view
 */
+ (void)viewsRightOf:(CGRect)frame views:(NSArray *)views rightMargin:(CGFloat)rightMargin;

/**
 * Aligns the given array of views to right of the frame/bounds.
 * The frame is usually the superview, though it's not a rule.
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsRightOf:(CGRect)frame views:(NSArray *)views;

#pragma mark - Vertical alignment

#pragma mark Top

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param CGFloat topMargin - space between top boundary and the first view
 */
+ (void)viewsTopOf:(CGRect)frame views:(NSArray *)views topMargin:(CGFloat)topMargin;

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsTopOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Center

/**
 * Vertically aligns the given array of views to middle of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsMiddleOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Bottom

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param CGFloat bottomMargin - space between top boundary and the first view
 */
+ (void)viewsBottomOf:(CGRect)frame views:(NSArray *)views bottomMargin:(CGFloat)bottomMargin;

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)viewsBottomOf:(CGRect)frame views:(NSArray *)views;

#pragma mark - Advanced

/**
 * Positions views into arbitrary starting point in the given
 * frame. You may define left and/or top blocks to declare
 * origin of the views.
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param (CGFloat (^)(CGFloat) leftBlock
 * @param (CGFloat (^)(CGFloat) topBlock
 */
+ (void)positionViewsTo:(CGRect)frame
                  views:(NSArray *)views
                   left:(CGFloat (^)(CGFloat width))leftBlock
                    top:(CGFloat (^)(CGFloat height))topBlock;

/**
 * Positions views into arbitrary starting point in the given
 * frame. You may define left block to declare origin of the views.
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param (CGFloat (^)(CGFloat) leftBlock
 */
+ (void)positionViewsTo:(CGRect)frame
                  views:(NSArray *)views
                   left:(CGFloat (^)(CGFloat width))leftBlock;

/**
 * Positions views into arbitrary starting point in the given
 * frame. You may define top block to declare origin of the views.
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param (CGFloat (^)(CGFloat) leftBlock
 * @param (CGFloat (^)(CGFloat) topBlock
 */
+ (void)positionViewsTo:(CGRect)frame
                  views:(NSArray *)views
                    top:(CGFloat (^)(CGFloat height))topBlock;

@end
