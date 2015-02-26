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
    NSInteger _outerMargin;
    CGRect _bounds;
}

- (void)updateMarginLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _items = @[self.item1, self.item2, self.item3, self.item4];
    
    _outerMargin = 0;
    _bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, 824);
    
    [self updateMarginLabel];
}

- (void)updateMarginLabel
{
    self.lblOuterMargin.text = [NSString stringWithFormat:@"%ld", (long)_outerMargin];
}

#pragma mark - Grouped items control

- (IBAction)itemsLeft:(id)sender {
    [UIView viewsLeftOf:_bounds views:_items leftMargin:_outerMargin];
}

- (IBAction)itemsCenter:(id)sender {
    [UIView viewsCenterOf:_bounds views:_items];
}

- (IBAction)itemsRight:(id)sender {
    [UIView viewsRightOf:_bounds views:_items rightMargin:_outerMargin];
}

- (IBAction)itemsTop:(id)sender {
    [UIView viewsTopOf:_bounds views:_items topMargin:_outerMargin];
}

- (IBAction)itemsMiddle:(id)sender {
    [UIView viewsMiddleOf:_bounds views:_items];
}

- (IBAction)itemsBottom:(id)sender {
    [UIView viewsBottomOf:_bounds views:_items bottomMargin:_outerMargin];
}

- (IBAction)decreaseOuterMargin:(id)sender {
    _outerMargin -= kMarginStep;
    [self updateMarginLabel];
}

- (IBAction)increaseOuterMargin:(id)sender {
    _outerMargin += kMarginStep;
    [self updateMarginLabel];
}

- (IBAction)reverseItems:(id)sender {
    if (self.item1.left == self.view.left) {
        self.item4.left = self.view.left;
        self.item4.top = self.view.top;
        
        self.item3.left = self.item4.right + 15;
        self.item3.top = self.item4.top;
        
        self.item2.left = self.item3.right + 15;
        self.item2.top = self.item3.top;
        
        self.item1.left = self.item2.right + 15;
        self.item1.top = self.item2.top;
    } else {
        [self sortHorizontally:nil];
    }
}

- (IBAction)sortHorizontally:(id)sender {
    self.item1.left = self.view.left;
    self.item1.top = self.view.top;
    
    self.item2.left = self.item1.right + 15;
    self.item2.top = self.item1.top;
    
    self.item3.left = self.item2.right + 15;
    self.item3.top = self.item2.top;
    
    self.item4.left = self.item3.right + 15;
    self.item4.top = self.item3.top;
}

- (IBAction)sortVertically:(id)sender {
    self.item1.top = self.view.top + 10;
    self.item1.left = self.view.left;
    
    self.item2.top = self.item1.bottom + 10;
    self.item2.left = self.item1.left;
    
    self.item3.top = self.item2.bottom + 10;
    self.item3.left = self.item2.left;
    
    self.item4.top = self.item3.bottom + 10;
    self.item4.left = self.item3.left;
}

# pragma mark - Small box control

- (IBAction)alignLeft:(id)sender {
    [self.smallBox leftOf:self.bigBox.frame];
}

- (IBAction)alignCenter:(id)sender {
    [self.smallBox centerOf:self.bigBox.frame];
}

- (IBAction)alignRight:(id)sender {
    [self.smallBox rightOf:self.bigBox.frame];
}

- (IBAction)valignTop:(id)sender {
    [self.smallBox topOf:self.bigBox.frame];
}

- (IBAction)valignMiddle:(id)sender {
    [self.smallBox centerOf:self.bigBox.frame];
}

- (IBAction)valignBottom:(id)sender {
    [self.smallBox bottomOf:self.bigBox.frame];
}

- (IBAction)inFront:(id)sender {
    [self.smallBox moveInFrontOf:self.bigBox.frame];
}

- (IBAction)next:(id)sender {
    [self.smallBox moveNextTo:self.bigBox.frame];
}

- (IBAction)above:(id)sender {
    [self.smallBox moveAbove:self.bigBox.frame];
}

- (IBAction)under:(id)sender {
    [self.smallBox moveUnder:self.bigBox.frame];
}
@end
