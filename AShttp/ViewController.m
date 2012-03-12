//
//  ViewController.m
//  AShttp
//
//  Created by 章琦 on 12-2-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"


@implementation ViewController
@synthesize urlBt;
@synthesize requestText;
@synthesize requestBt;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [requestBt release];
    requestBt = nil;
    [self setRequestBt:nil];
    [urlBt release];
    urlBt = nil;
    [self setUrlBt:nil];
    [self setUrlBt:nil];
    [requestText release];
    requestText = nil;
    [self setRequestText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [requestBt release];
    [requestBt release];
    [urlBt release];
    [urlBt release];
    [urlBt release];
    [requestText release];
    [requestText release];
    [super dealloc];
}
- (IBAction)requestBt:(id)sender {
    // Create new SBJSON parser object
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    // Prepare URL request to download statuses from Twitter
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://60.190.204.107:8002/interface.aspx?ACTION=xldz&xlbh=000024"]];
    
    // Perform request and get JSON back as a NSData object
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // Get JSON as a NSString from NSData response
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    json_string=[json_string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//反编码
    // parse the JSON response into an object
    // Here we're using NSArray since we're parsing an array of JSON status objects
    NSArray *statuses = [parser objectWithString:json_string error:nil];
    
    // Each element in statuses is a single status
    // represented as a NSDictionary
    for (NSDictionary *status in statuses)
    {
        // You can retrieve individual values using objectForKey on the status NSDictionary
        // This will print the tweet and username to the console
        NSLog(@"站台编号：%@ - 站台名称：%@", [status objectForKey:@"ztbh"], [status objectForKey:@"ztmc"]);
        requestText.text=[status objectForKey:@"ztmc"];
    }
    
   
    
   
}

- (IBAction)urlBt:(id)sender {
//    NSURL *url = [ NSURL URLWithString : @"" ];
//    // 构造 ASIHTTPRequest 对象
//    ASIHTTPRequest *request = [ ASIHTTPRequest requestWithURL :url];
//    // 开始同步请求
//    [request startSynchronous ];
//    NSError *error = [request error ];
//    assert (!error);
//    // 如果请求成功，返回 Response
//    NSString *response = [request responseString ];
//    NSLog ( @"%@" ,response);


    NSURL *url = [NSURL URLWithString:@"http://60.190.204.107:8002/interface.aspx?ACTION=xldz&xlbh=000024"];
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    jsonString=[jsonString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//反编码
    
    SBJsonParser *parse=[[SBJsonParser alloc]init];
    //NSDictionary *json=[parse objectWithString:jsonString error:nil];
    
    
    id response = [parse objectWithString:jsonString error:NULL];
    
    NSDictionary *feed = (NSDictionary *)response;
    NSArray *nodes = (NSArray *)[feed valueForKey:@"ztbh"]; // here's I don't know what to put
    
    
    for (int i=0;i<nodes.count; i++) {
        NSDictionary *node = (NSDictionary *)[nodes objectAtIndex:i];
        //NSLog(@"id = %@",[node objectForKey:@"ztbh"]);
        NSLog(@"%@",node);
        
    }
    
        
    
    //NSLog(@"返回值：%@",json);
    //NSLog(@"%@",nodes);
    

    
    requestText.text=jsonString;
    

}




@end
