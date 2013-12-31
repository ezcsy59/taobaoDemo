//
//  TestViewController.m
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import "TestViewController.h"

#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"
#import "ASIHTTPRequest.h"
#import "SBJSON.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.array =[[NSMutableArray alloc] init ];
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationItem.title= @"测试";
    
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
        //        NSLog(response);
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:response];
        //                NSLog(dict);
        NSMutableDictionary *itemdic = [dict valueForKey:@"items_search_response"];
        NSMutableDictionary *itemscst =[itemdic valueForKey:@"items_search"];
        
        NSMutableDictionary *items = [itemscst valueForKey:@"items"];
        NSMutableArray *item =[items valueForKey:@"item"];
        //已获取到item
        self.array = item;
        
        NSLog(@"已获取到item");
    }
    
    
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//   static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
//    
//   static BOOL nibsRegistered = NO;
//    if (!nibsRegistered) {
//        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
//        nibsRegistered = YES;
//   
   
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];

    
    static NSString *CellIdentifier = @"CustomCellIdentifier";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell= (CustomCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"CustomCell" owner:self options:nil] objectAtIndex:0];
    }

    // Configure the cell...
    NSMutableDictionary *temp = [self.array objectAtIndex:indexPath.row];
    
    NSString *title = [temp valueForKey:@"title" ];
    cell.title.text = title ;
    
    NSString *celler = [temp valueForKey:@"seller_name"];
    cell.subtitle.text = celler ;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}



@end
