//
//  ViewController.m
//  Ticket Box
//
//  Created by Raghav Bagla on 26/02/13.
//  Copyright (c) 2013 Raghav Bagla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//Private method definations

-(void)incrementCounter;
-(void)updateLabel;


@end

@implementation ViewController

@synthesize counterLabel;
@synthesize readerView;
@synthesize tickets_data=_tickets_data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Set the delegate for the zbar reader view and start it.
    readerView.readerDelegate = self;
    [readerView start];
    tickets_data = [[NSMutableArray alloc] initWithCapacity:20];
    counter = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) readerView: (ZBarReaderView*) view
     didReadSymbols: (ZBarSymbolSet*) syms
          fromImage: (UIImage*) img
{
    // do something useful with results
    for(ZBarSymbol *sym in syms) {
        NSLog(@"%@", sym.data);
        [self incrementCounter];
        [self updateLabel];
        [tickets_data addObject:[NSString stringWithFormat:@"%@",sym.data]];
        [tickets_table reloadData];
        AudioServicesPlayAlertSound(1005);
        break;
    }
    NSLog(@"%d", [tickets_data count]);
}

//Rest button

- (IBAction)resetButtonPressed:(id)sender
{
    [tickets_data removeAllObjects];
    //Tells the ticket view to reload the data.
    [tickets_table reloadData];
    counter = 0;
    [self updateLabel];
    NSLog(@"%d", [tickets_data count]);
    
}

//Table view methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tickets_data objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tickets_data count];
}

- (void)viewDidUnload {

    [super viewDidUnload];
}

-(void)incrementCounter
{
    counter = counter + 1;
    NSLog(@"People Counter:%lu",(unsigned long) counter);
}

-(void)updateLabel
{
    self.counterLabel.text = [NSString stringWithFormat:@"%d", counter];
}

@end
