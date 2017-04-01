//
//  ViewController.m
//  Drop-downAmplification
//
//  Created by lixiang on 2017/4/1.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "ViewController.h"

const CGFloat topViewH=350;

@interface ViewController ()

@property(nonatomic,weak)UIImageView * topv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置内边距（让cell往下移动一段距离）
    self.tableView.contentInset=UIEdgeInsetsMake(topViewH/2, 0, 0, 0);
    UIImageView * topImgV=[[UIImageView alloc] init];
    topImgV.image=[UIImage imageNamed:@"test"];
    topImgV.frame=CGRectMake(0, -topViewH, self.view.frame.size.width, topViewH);
    topImgV.contentMode=UIViewContentModeScaleAspectFill;
    [self.tableView insertSubview:topImgV atIndex:0];
    self.topv=topImgV;
}

#pragma mark -数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID
              ];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"测试数据---%ld",indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"向下拉了多少=====%f",-topViewH/2-scrollView.contentOffset.y);
    //向下拉了多少
    CGFloat down=-150-scrollView.contentOffset.y;
    if (down<0) {
        return;
    }
    
    CGRect frame=self.topv.frame;
    frame.size.height=topViewH+down*0.5;//*3(决定图片变大的速度值越大速度越快)
    self.topv.frame=frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
