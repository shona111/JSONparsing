//
//  infoTableViewController.h
//  JSONparsing
//
//  Created by Student-002 on 22/08/16.
//  Copyright © 2016 Felix-ITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoTableViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSMutableArray *countarray;

@property(nonatomic,retain)NSMutableData *mydata;



@end
