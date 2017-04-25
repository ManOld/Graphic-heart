//
//  ViewController.m
//  hahah
//
//  Created by admin on 2017/4/25.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "HeartViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) UISearchController *searchCtl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tv=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    tv.delegate=self;
    tv.dataSource=self;
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tv];
    tv.tableFooterView=[[UIView alloc]init];
    self.tableview=tv;
    
    UISearchController *search=[[UISearchController alloc]initWithSearchResultsController:nil];
    search.searchBar.frame=CGRectMake(0, 0, 25, 25);
    //  修改Searchbar的背景色
    search.searchBar.barTintColor=[UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1] ;
    
    
    /*****去掉self.searchController.searchBar上下的两条黑线***********/
    UISearchBar *searchBar = search.searchBar;
    UIImageView *barImageView = [[[searchBar.subviews firstObject] subviews] firstObject];
    barImageView.layer.borderColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1].CGColor;
    barImageView.layer.borderWidth = 1;
    
    search.searchResultsUpdater=self;
    
    [search.searchBar sizeToFit];
    
    tv.tableHeaderView=search.searchBar;
    self.searchCtl=search;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchCtl.active) {
        return 3;
    }else{
        return 5;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HeartViewController *heart = [[HeartViewController alloc] init];
   
    if (indexPath.row>2) {
        heart.state=2;
    }else{
        heart.state=1;
    }
     [self.navigationController pushViewController:heart animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[self str];
    return cell;
}

-(NSString *)str{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:date];
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    if (searchController.active) {
        //        显示取消按钮。英文变中文
        searchController.searchBar.showsCancelButton=YES;
        UIButton *canceLBtn = [searchController.searchBar valueForKey:@"cancelButton"];
        [canceLBtn setTitleColor:[UIColor colorWithRed:22.0/255 green:160.0/255 blue:3.0/255 alpha:1]
                        forState:UIControlStateNormal];
        [canceLBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
