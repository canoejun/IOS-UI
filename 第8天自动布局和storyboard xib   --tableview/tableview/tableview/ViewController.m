//
//  ViewController.m
//  tableview
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "ZJSettingGroups.h"
#import "ZJEachSetting.h"


@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据数组  */
@property (nonatomic,strong) NSArray * settingArray;

@end

//当一个样式是只读的时候，那么创建的时候就应该定义好，告诉他如何做

@implementation ViewController

#pragma mark ------ 懒加载 ------
-(NSArray *)settingArray{
    if (!_settingArray) {
//        self.settingArray = @[@[@"通用",@"隐私"],@[@"设置",@"数据",@"其他",@"设备",@"设备",@"权限"],@[@"设置",@"数据",@"其他",@"设备",@"设备",@"权限"],@[@"通用"]];
        ZJSettingGroups * g0 = [[ZJSettingGroups alloc]init];
        g0.headerNameString = @"基本设置";
        g0.footerNameString = @"0基本";
        g0.eachSettingArray = @[
                                [ZJEachSetting ZJEachSettingWithname:@"通用" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"隐私" iconname:@""]
                                ];
        
        ZJSettingGroups * g1 = [[ZJSettingGroups alloc]init];
        g1.headerNameString = @"进阶设置";
        g1.footerNameString = @"1进阶";
        g1.eachSettingArray = @[
                                [ZJEachSetting ZJEachSettingWithname:@"数据" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"其他" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"设备" iconname:@""]
                                ];
        
        ZJSettingGroups * g2 = [[ZJSettingGroups alloc]init];
        g2.headerNameString = @"高级设置";
        g2.footerNameString = @"2高级";
        g2.eachSettingArray = @[
                                [ZJEachSetting ZJEachSettingWithname:@"权限" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"开发" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"USB" iconname:@""],
                                [ZJEachSetting ZJEachSettingWithname:@"调试" iconname:@""]
                                ];
        _settingArray = @[g0,g1,g2];
        
        
    }
    return _settingArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    设置数据源        一般都是控制器作为数据源
    self.tableView.dataSource = self;
    
}


#pragma mark ------ <UITableViewDataSource>------
//这边协议中的数据只需要写在这里就行了，不需要自己去调用，他自己会在适当的时候进行调用
//其他的协议中的方法都是以UItableView开头的


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    将整体的tableview分为多少组
//    return 4;
    return  self.settingArray.count;
}



//在查找数据的时候尽量先写出返回值类型，因为总共就那么几个方法，比较好辨别
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    每一组的需要设置多少的cell
//    switch (section) {
//        case 0:
//            return 2;
//            break;
//        case 1:
//            return 6;
//            break;
//        case 2:
//            return 6;
//            break;
//        case 3:
//            return 1;
//            break;
//
//        default:return 0;
//            break;
//    }
    ZJSettingGroups * temp = self.settingArray[section];
    
    return temp.eachSettingArray.count;
}


//单元格  告诉每一组的每一个单元格显示什么内容(tableView每一行都是一个tableViewCell或者是他的子类)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell  = [[UITableViewCell alloc]init];
    
    
//    设置每一行的最后提示图标，表示能够点击和显示的
    //设置右边的指示样式
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
//    如果右边不是指示标识，而是控件，类似于开关，那么使用
    cell.accessoryView = [[UISwitch alloc]init];
    
    ZJSettingGroups * setting = self.settingArray[indexPath.section];
    ZJEachSetting * eset =  setting.eachSettingArray[indexPath.row];
    
    cell.textLabel.text = eset.settingName;
//    cell.imageView.image = [UIImage imageNamed:eset.iconName];
//    通过indexpath能够确定唯一的数据
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            cell.textLabel.text = @"通用";
//        }else{
//            cell.textLabel.text = @"隐私";
//        }
//    }else{
//        cell.textLabel.text = [NSString stringWithFormat:@"%ld组%ld行 其他数据",indexPath.section,indexPath.row];
//    }
//    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
   
    return cell;
    
}

//为每一组的数据添加头部标识
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ZJSettingGroups * temp = self.settingArray[section];
    
    
    return temp.headerNameString;
}


//为每一组的数据添加尾部标识
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
     ZJSettingGroups * temp = self.settingArray[section];
    return temp.footerNameString;
}
@end











