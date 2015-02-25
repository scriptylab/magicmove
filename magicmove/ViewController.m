//
//  ViewController.m
//  magicmove
//
//  Created by Stanislav Musil on 2/21/15.
//  Copyright (c) 2015 scriptylab. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MMView.h"

NSInteger const kMarginStep = 5;

@interface ViewController ()
{
    NSArray *_items;
    NSInteger _innerMargin, _outerMargin;
    CGRect _bounds;
}

- (void)updateMarginLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _items = @[self.item1, self.item2, self.item3];
    
    _innerMargin = 0;
    _outerMargin = 0;
    _bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, 824);
    
    [self updateMarginLabels];
}

- (void)updateMarginLabels
{
    self.lblInnerMargin.text = [NSString stringWithFormat:@"%ld", (long)_innerMargin];
    self.lblOuterMargin.text = [NSString stringWithFormat:@"%ld", (long)_outerMargin];
}

#pragma mark - Grouped items control

- (IBAction)decreaseInnerMargin:(id)sender {
    _innerMargin -= kMarginStep;
    [self updateMarginLabels];
}

- (IBAction)increaseInnerMargin:(id)sender {
    _innerMargin += kMarginStep;
    [self updateMarginLabels];
}

- (IBAction)decreaseOuterMargin:(id)sender {
    _outerMargin -= kMarginStep;
    [self updateMarginLabels];
}

- (IBAction)increaseOuterMargin:(id)sender {
    _outerMargin += kMarginStep;
    [self updateMarginLabels];
}

# pragma mark - Small box control

- (IBAction)itemsLeft:(id)sender {
    [UIView alignViewsLeftOf:_bounds views:_items leftMargin:_outerMargin];
}

- (IBAction)itemsCenter:(id)sender {
    [UIView alignViewsCenterOf:_bounds views:_items];
}

- (IBAction)itemsRight:(id)sender {
    [UIView alignViewsRightOf:_bounds views:_items rightMargin:_outerMargin];
}

- (IBAction)itemsTop:(id)sender {
    [UIView verticalAlignViewsTopOf:_bounds views:_items topMargin:_outerMargin];
}

- (IBAction)itemsMiddle:(id)sender {
    [UIView verticalAlignViewsCenterOf:_bounds views:_items];
}

- (IBAction)itemsBottom:(id)sender {
    [UIView verticalAlignViewsBottomOf:_bounds views:_items bottomMargin:_outerMargin];
}

- (IBAction)reverseItems:(id)sender {
    _items = [[_items reverseObjectEnumerator] allObjects];
}

- (IBAction)sortHorizontally:(id)sender {
    self.item1.left = self.view.left;
    self.item1.top = self.view.top;
    
    self.item2.left = self.item1.right;
    self.item2.top = self.item1.top;
    
    self.item3.left = self.item2.right;
    self.item3.top = self.item2.top;
}

- (IBAction)sortVertically:(id)sender {
    self.item1.top = self.view.top;
    self.item1.left = self.view.left;
    
    self.item2.top = self.item1.bottom;
    self.item2.left = self.item1.left;
    
    self.item3.top = self.item2.bottom;
    self.item3.left = self.item2.left;
}

- (IBAction)alignLeft:(id)sender {
    [self.smallBox alignLeftOf:self.bigBox.frame];
}

- (IBAction)alignCenter:(id)sender {
    [self.smallBox alignCenterOf:self.bigBox.frame];
}

- (IBAction)alignRight:(id)sender {
    [self.smallBox alignRightOf:self.bigBox.frame];
}

- (IBAction)valignTop:(id)sender {
    [self.smallBox verticalAlignTopOf:self.bigBox.frame];
}

- (IBAction)valignMiddle:(id)sender {
    [self.smallBox verticalAlignCenterOf:self.bigBox.frame];
}

- (IBAction)valignBottom:(id)sender {
    [self.smallBox verticalAlignBottomOf:self.bigBox.frame];
}

- (IBAction)inFront:(id)sender {
    [self.smallBox moveFrameInFrontOf:self.bigBox.frame withMargin:0];
}

- (IBAction)next:(id)sender {
    [self.smallBox moveFrameNextTo:self.bigBox.frame withMargin:0];
}

- (IBAction)above:(id)sender {
    [self.smallBox moveFrameAbove:self.bigBox.frame withMargin:0];
}

- (IBAction)under:(id)sender {
    [self.smallBox moveFrameUnder:self.bigBox.frame withMargin:0];
}
@end
