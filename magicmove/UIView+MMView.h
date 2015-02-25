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
 * Moves the frame by the given X value
 * x = -10 moves frame by 10 points left
 * x = 10 moves frame by 10 points right
 *
 * @param CGFloat x
 */
- (void)moveFrameByX:(CGFloat)x;

/**
 * Moves the frame by the given Y value
 * y = -10 moves frame by 10 points up
 * y = 10 moves frame by 10 points down
 *
 * @param CGFloat y
 */
- (void)moveFrameByY:(CGFloat)y;

/**
 * Moves the frame to the given X value
 *
 * @param CGFloat x
 */
- (void)moveFrameToX:(CGFloat)x;

/**
 * Moves the frame to the given Y value
 *
 * @param CGFloat y
 */
- (void)moveFrameToY:(CGFloat)y;

/**
 * Moves frame in front of the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveFrameInFrontOf:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame next to the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveFrameNextTo:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame above the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveFrameAbove:(CGRect)frame withMargin:(CGFloat)margin;

/**
 * Moves frame under the given frame with specified margin
 *
 * @param CGRect frame
 * @param CGFloat margin
 */
- (void)moveFrameUnder:(CGRect)frame withMargin:(CGFloat)margin;

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

/**
 * Changes the frame width by the given points
 * f.e. points = -10 reduces the frame width by 10 points
 *
 * @param CGFloat points
 */
- (void)changeFrameWidthBy:(CGFloat)points __deprecated;

/**
 * Changes the frame height by the given points
 * f.e. points = -10 reduces the frame height by 10 points
 *
 * @param CGFloat points
 */
- (void)changeFrameHeightBy:(CGFloat)points __deprecated;

#pragma mark - Horizontal alignment

/**
 * Aligns to the left of the given frame
 *
 * @param CGRect frame
 */
- (void)alignLeftOf:(CGRect)frame;

/**
 * Aligns to the center of the given frame
 *
 * @param CGRect frame
 */
- (void)alignCenterOf:(CGRect)frame;

/**
 * Aligns to the right of the given frame
 *
 * @param CGRect frame
 */
- (void)alignRightOf:(CGRect)frame;

/**
 * Aligns the view to the left in array of views
 * to the given index
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views;
 */
- (void)alignLeftOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

/**
 * Aligns the view to the center in array of views
 * to the given index
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views
 */
- (void)alignCenterOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

/**
 * Aligns the view to the center in array of views
 * to the given index
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views
 */
- (void)alignRightOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

#pragma mark - Vertical alignment

/**
 * Sets vertical align to the top of the given frame
 *
 * @param CGRect frame
 */
- (void)verticalAlignTopOf:(CGRect)frame;

/**
 * Sets vertical align to the center of the given frame
 *
 * @param CGRect frame
 */
- (void)verticalAlignCenterOf:(CGRect)frame;

/**
 * Sets vertical align to the bottom of the given frame
 *
 * @param CGRect frame
 */
- (void)verticalAlignBottomOf:(CGRect)frame;

/**
 * Sets vertical TOP align to self's frame by the given list
 * of items that should be ordered vertically
 *
 * for example: I have two tabs in menu (tab1 and tab2), and I want to have
 * them both in center of the menu, though they are single views.
 *
 *      TAB1   | MENU |
 *      TAB2   | MENU |
 *             | MENU |
 *             | MENU |
 *
 * First I prepare list of items: NSArray *views = @[tab1, tab2];
 * Then I call [tab1 verticalAlignTopOf:menu.frame withIndex:[views indexOfObject:tab1] inViews:views];
 * To position also tab2: [tab2 verticalAlignTopOf:menu.frame withIndex:[views indexOfObject:tab2] inViews:views];
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views
 */
- (void)verticalAlignTopOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

/**
 * Sets vertical CENTER align to self's frame by the given list
 * of items that should be ordered vertically
 *
 * for example: I have two tabs in menu (tab1 and tab2), and I want to have
 * them both in center of the menu, though they are single views.
 *
 *             | MENU |
 *      TAB1   | MENU |
 *      TAB2   | MENU |
 *             | MENU |
 *
 * First I prepare list of items: NSArray *views = @[tab1, tab2];
 * Then I call [tab1 verticalAlignCenterOf:menu.frame withIndex:[views indexOfObject:tab1] inViews:views];
 * To position also tab2: [tab2 verticalAlignCenterOf:menu.frame withIndex:[views indexOfObject:tab2] inViews:views];
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views
 */
- (void)verticalAlignCenterOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

/**
 * Sets vertical BOTTOM align to self's frame by the given list
 * of items that should be ordered vertically
 *
 * for example: I have two tabs in menu (tab1 and tab2), and I want to have
 * them both in center of the menu, though they are single views.
 *
 *             | MENU |
 *             | MENU |
 *      TAB2   | MENU |
 *      TAB1   | MENU |
 *
 * First I prepare list of items: NSArray *views = @[tab1, tab2];
 * Then I call [tab1 verticalAlignBottomOf:menu.frame withIndex:[views indexOfObject:tab1] inViews:views];
 * To position also tab2: [tab2 verticalAlignBottomOf:menu.frame withIndex:[views indexOfObject:tab2] inViews:views];
 *
 * @param CGRect frame
 * @param NSUInteger index
 * @param NSArray* views
 */
- (void)verticalAlignBottomOf:(CGRect)frame withIndex:(NSUInteger)index inViews:(NSArray *)views;

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
+ (void)alignViewsLeftOf:(CGRect)frame views:(NSArray *)views leftMargin:(CGFloat)leftMargin;

/**
 * Aligns the given array of views to left of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)alignViewsLeftOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Center

/**
 * Aligns the given array of views to center of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)alignViewsCenterOf:(CGRect)frame views:(NSArray *)views;

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
+ (void)alignViewsRightOf:(CGRect)frame views:(NSArray *)views rightMargin:(CGFloat)rightMargin;

/**
 * Aligns the given array of views to right of the frame/bounds.
 * The frame is usually the superview, though it's not a rule.
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)alignViewsRightOf:(CGRect)frame views:(NSArray *)views;

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
+ (void)verticalAlignViewsTopOf:(CGRect)frame views:(NSArray *)views topMargin:(CGFloat)topMargin;

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)verticalAlignViewsTopOf:(CGRect)frame views:(NSArray *)views;

#pragma mark Center

/**
 * Vertically aligns the given array of views to middle of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)verticalAlignViewsCenterOf:(CGRect)frame views:(NSArray *)views;

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
+ (void)verticalAlignViewsBottomOf:(CGRect)frame views:(NSArray *)views bottomMargin:(CGFloat)bottomMargin;

/**
 * Vertically aligns the given array of views on top of the frame/bounds.
 * The frame usually belongs to the superview, though it's not a rule.
 * This method also offers custom margins
 *
 * @param CGRect frame
 * @param NSArray* views
 */
+ (void)verticalAlignViewsBottomOf:(CGRect)frame views:(NSArray *)views;

#pragma mark - Advanced

/**
 * Positions views from the given left and top blocks into the given frame.
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
 * Positions views from the given left block into the given frame.
 *
 * @param CGRect frame
 * @param NSArray* views
 * @param (CGFloat (^)(CGFloat) leftBlock
 */
+ (void)positionViewsTo:(CGRect)frame
                  views:(NSArray *)views
                   left:(CGFloat (^)(CGFloat width))leftBlock;

/**
 * Positions views from the given top block into the given frame.
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
