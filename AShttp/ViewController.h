//
//  ViewController.h
//  AShttp
//
//  Created by 章琦 on 12-2-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

#import "SBJson.h"


@interface ViewController : UIViewController{
    
    IBOutlet UIButton *requestBt;
    IBOutlet UIButton *urlBt;
    IBOutlet UITextView *requestText;
}

@property (retain, nonatomic) IBOutlet UIButton *requestBt;
@property (retain, nonatomic) IBOutlet UIButton *urlBt;
@property (retain, nonatomic) IBOutlet UITextView *requestText;

- (IBAction)requestBt:(id)sender;
- (IBAction)urlBt:(id)sender;


@end
