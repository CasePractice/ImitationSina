//
//  FaXianController.m
//  XinLangCase
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 zhiYou. All rights reserved.
//

#import "FaXianController.h"
extern UIColor*color;
extern int PINGMU_KUAN;
extern int PINGMU_GAO;
@interface FaXianController ()<UIScrollViewDelegate>
{
    UILabel*hongTiao;
}
@end

@implementation FaXianController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fengZhuangDaoHangView];
    UIScrollView*scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, PINGMU_KUAN, PINGMU_GAO-64-49)];
    scrollView.contentSize=CGSizeMake(PINGMU_KUAN*2, PINGMU_GAO-64-49);
    scrollView.delegate=self;
    scrollView.bounces=NO;
    scrollView.pagingEnabled=YES;
    scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollView];
}
#pragma mark-封装DaoHang_View
-(void)fengZhuangDaoHangView
{
    UIView*DaoHang_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0, PINGMU_KUAN, 64)];
    //注册按钮
    UIButton*ZhuCe=[UIButton buttonWithType:UIButtonTypeCustom];
    [ZhuCe setTitleColor:color forState:UIControlStateNormal];
    [ZhuCe addTarget:self action:@selector(zhuCeAnNiuDianJiShiJian:) forControlEvents:UIControlEventTouchUpInside];
    ZhuCe.frame=CGRectMake(14, 0, 50, 30);
    [self fengZhuangSheZhiDaoHangViewAnNiuShuXingShiJianButton:ZhuCe Title:@"注册" ];
    ZhuCe.tag=1;
    [DaoHang_View addSubview:ZhuCe];
    //热门按钮
    UIButton*reMen=[UIButton buttonWithType:UIButtonTypeCustom];
    [reMen addTarget:self action:@selector(zhuCeAnNiuDianJiShiJian:) forControlEvents:UIControlEventTouchUpInside];
    reMen.frame=CGRectMake(PINGMU_KUAN/2-70, 0, 70, 30);
    [self fengZhuangSheZhiDaoHangViewAnNiuShuXingShiJianButton:reMen Title:@"热门"];
    [reMen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    reMen.tag=2;
    [DaoHang_View addSubview:reMen];
    //明星按钮
    UIButton*mingXing=[UIButton buttonWithType:UIButtonTypeCustom];
    [mingXing addTarget:self action:@selector(zhuCeAnNiuDianJiShiJian:) forControlEvents:UIControlEventTouchUpInside];
    mingXing.frame=CGRectMake(PINGMU_KUAN/2, 0, 70, 30);
    [self fengZhuangSheZhiDaoHangViewAnNiuShuXingShiJianButton:mingXing Title:@"明星" ];
    [mingXing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    mingXing.tag=3;
    [DaoHang_View addSubview:mingXing];
    //登录按钮
    UIButton*dengLu=[UIButton buttonWithType:UIButtonTypeCustom];
    [dengLu setTitleColor:color forState:UIControlStateNormal];
    [dengLu addTarget:self action:@selector(zhuCeAnNiuDianJiShiJian:) forControlEvents:UIControlEventTouchUpInside];
    dengLu.frame=CGRectMake(PINGMU_KUAN-50-24, 0, 50, 30);
    [self fengZhuangSheZhiDaoHangViewAnNiuShuXingShiJianButton:dengLu Title:@"登录" ];
    dengLu.tag=4;
    [DaoHang_View addSubview:dengLu];
    //按钮跟随红条
    hongTiao=[[UILabel alloc]initWithFrame:CGRectMake(PINGMU_KUAN/2-70, 42, 70, 2)];
    hongTiao.backgroundColor=[UIColor redColor];
    [DaoHang_View addSubview:hongTiao];
    
    DaoHang_View.backgroundColor=[UIColor clearColor];
    [self.navigationController.navigationBar addSubview:DaoHang_View];
    
    
}
#pragma mark-封装DaoHang_View上的所有的按钮属性
-(void)fengZhuangSheZhiDaoHangViewAnNiuShuXingShiJianButton:(UIButton*)button Title:(NSString*)tiele
{
    [button setTitle:tiele forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:22];
}
#pragma mark-导航上的按钮点击事件
-(void)zhuCeAnNiuDianJiShiJian:(UIButton*)sender
{
    UIButton*reMen=(UIButton*)[self.view viewWithTag:2];
    UIButton*mingXing=(UIButton*)[self.view viewWithTag:3];
   
    switch (sender.tag)
    {
        case 1:
            
            break;
        case 2:
        {
            [reMen setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [mingXing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [UIView animateWithDuration:0.1 animations:^{
                CGRect rect=hongTiao.frame;
                rect.origin.x=sender.frame.origin.x;
                hongTiao.frame=rect;
            }];
        }
            break;
        case 3:
        {
            [reMen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [mingXing setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [UIView animateWithDuration:0.1 animations:^{
                CGRect rect=hongTiao.frame;
                rect.origin.x=sender.frame.origin.x;
                hongTiao.frame=rect;
            }];
        }
            break;
        case 4:
            
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
