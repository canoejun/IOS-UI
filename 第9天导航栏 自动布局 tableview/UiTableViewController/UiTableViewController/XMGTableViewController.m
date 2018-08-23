//
//  XMGTableViewController.m
//  UiTableViewController
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "XMGTableViewController.h"

@interface XMGTableViewController ()

@end

@implementation XMGTableViewController
static NSString * ID = @"wine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    小技巧将tableview后面的线条隐藏
    self.tableView.tableFooterView = [UIView new];
    
//    注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 300;
}
/*
 *  每当一个cell进入到用户的视野中，那么这个cell就会调用一次（分别在不同的地址中），这样子很耗内存
 *  原始的那种方式每进入视图一个，那么就创建一个的方式，cell离开后就会被系统销毁。这样子放在缓存池中，能够使得内存占用比较少
 */
#pragma mark ------ 性能优化 ------
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    优化定义为static，然后静态全局变量，只会被初始化一次  改变生命周期
//    0.定义重用标识
//    static NSString * ID = @"wine";
    /*
     *  只需要注册一次，而且是必须是在之前注册，否则可能是为空，所以这时候需要将这个注册放在didload里面
     */
    
    //    注册cell        根据Id表示注册的对应cell类型为UItableview类型
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    //1.当系统自动调用这个方法的时候，首先先去缓存池中查看是否存在标识的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    /*
     *  经过上述两步，取出来的cell一定是存在值的，经历过注册cell，那么就不需要自己再自己进行判断了的
     */
    
//    //2.如果缓存池中不存在，那么自己创建
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
////        所有cell相同设置都是放在这个里面，因为后面都会不断的调用
//        cell.backgroundColor = [UIColor redColor];
//    }
    //3.设置数据
     cell.textLabel.text = [NSString stringWithFormat:@"%ld组%ld行",indexPath.section,indexPath.row];
    
    
//    在优化的时候，必须是有if就有else，否则可能会出现问题的
    if (indexPath.row %2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
         cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
//    UITableViewCell * cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld组%ld行",indexPath.section,indexPath.row];
    
    /*
     *  注意事项：cell的标识最好是起和项目有关的名字
     */
    
    

    
    
    return cell;
    
}

@end











