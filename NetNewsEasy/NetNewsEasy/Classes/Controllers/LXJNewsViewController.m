//
//  LXJNewsViewController.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJNewsViewController.h"
#import "LXJNewsModel.h"
#import "LXJNewsDetailsViewCell.h"

@interface LXJNewsViewController ()

/**
 存储当前页面的新闻数据
 */
@property (nonatomic, strong) NSArray<LXJNewsModel *> *newsData;
@end

// 每个 cell 的重用 id
static NSString *cellID = @"newsDetails";

@implementation LXJNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// urlstr 的 set 方法
- (void)setURLStr:(NSString *)URLStr{
    _URLStr = URLStr;
    
    // 请求网络数据
    [LXJNewsModel requestNewsDataFromURLStr:URLStr completion:^(NSArray *newsData) {
//        NSLog(@"%@",newsData);
        // 数据关联
        self.newsData = newsData;
        // 刷新数据
        [self.tableView reloadData];
    }];
    
    // 注册单元格
    [self.tableView registerClass:[LXJNewsDetailsViewCell class] forCellReuseIdentifier:cellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LXJNewsDetailsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.newsData[indexPath.row].title;
    // 赋值模型对象
//    cell.newsDetailsModel = self.newsData[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
