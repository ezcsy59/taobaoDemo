//
//  TestViewController.h
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface TestViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{

    
}
@property (retain,nonatomic) NSMutableArray *array;
-(void)loadmore;


@end
