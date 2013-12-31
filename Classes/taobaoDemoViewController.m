//
//  taobaoDemoViewController.m
//  taobaoDemo
//
//  Created by YangZigang on 11-3-22.
//  Copyright 2011 audiocn.com. All rights reserved.
//

#import "taobaoDemoViewController.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"
#import "ASIHTTPRequest.h"
#import "SBJSON.h"
@implementation taobaoDemoViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict testDefault];
	[dict setObject:@"iPhone" forKey:@"keyword"];
	NSString *urlString = [dict urlString];
	urlString = [NSString stringWithFormat:@"http://api.59miao.com/router/rest?%@", urlString];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
//	NSURLRequest *request = [NSURLRequest requestWithURL:url];
//	[web loadRequest:request];
    
    //asihttprequest 测试
    ASIHTTPRequest *ASIrequest = [ASIHTTPRequest requestWithURL:url];
    [ASIrequest startSynchronous];
    NSError *error = [ASIrequest error];
    if(!error){
       NSString *response = [ASIrequest responseString];
        NSLog(response);
        
         SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:response];
//        NSLog(dict);
    }
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[web release];
    [super dealloc];
}

@end
