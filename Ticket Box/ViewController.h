//
//  ViewController.h
//  Ticket Box
//
//  Created by Raghav Bagla on 26/02/13.
//  Copyright (c) 2013 Raghav Bagla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarReaderView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController  < ZBarReaderViewDelegate, UITableViewDataSource >
{
    ZBarReaderView *readerView;
    NSMutableArray *tickets_data;
    IBOutlet UITableView *tickets_table;
    NSInteger counter;
    NSArray *demo_array;
    IBOutlet UILabel *counterLabel;
}
- (IBAction)resetButtonPressed:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) IBOutlet ZBarReaderView *readerView;
@property (nonatomic, retain) NSMutableArray *tickets_data;
@end
