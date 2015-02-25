//
//  ViewController.h
//  magicmove
//
//  Created by Stanislav Musil on 2/21/15.
//  Copyright (c) 2015 scriptylab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *item1;
@property (weak, nonatomic) IBOutlet UIView *item2;
@property (weak, nonatomic) IBOutlet UIView *item3;

@property (weak, nonatomic) IBOutlet UIView *smallBox;
@property (weak, nonatomic) IBOutlet UIView *bigBox;

@property (weak, nonatomic) IBOutlet UILabel *lblInnerMargin;
@property (weak, nonatomic) IBOutlet UILabel *lblOuterMargin;

/**
 * Grouped items control
 */
- (IBAction)decreaseInnerMargin:(id)sender;
- (IBAction)increaseInnerMargin:(id)sender;

- (IBAction)decreaseOuterMargin:(id)sender;
- (IBAction)increaseOuterMargin:(id)sender;

- (IBAction)itemsLeft:(id)sender;
- (IBAction)itemsCenter:(id)sender;
- (IBAction)itemsRight:(id)sender;

- (IBAction)itemsTop:(id)sender;
- (IBAction)itemsMiddle:(id)sender;
- (IBAction)itemsBottom:(id)sender;

- (IBAction)reverseItems:(id)sender;
- (IBAction)sortHorizontally:(id)sender;
- (IBAction)sortVertically:(id)sender;

/**
 * Small box control
 */
- (IBAction)alignLeft:(id)sender;
- (IBAction)alignCenter:(id)sender;
- (IBAction)alignRight:(id)sender;

- (IBAction)valignTop:(id)sender;
- (IBAction)valignMiddle:(id)sender;
- (IBAction)valignBottom:(id)sender;

- (IBAction)inFront:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)above:(id)sender;
- (IBAction)under:(id)sender;

@end

