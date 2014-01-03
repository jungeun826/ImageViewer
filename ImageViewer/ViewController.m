//
//  ViewController.m
//  ImageViewer
//
//  Created by SDT-1 on 2014. 1. 2..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "CarImgModel.h"
@interface ViewController (){
    CarImgModel * imgs;
    UIImageView *imgView;
}
@property (weak, nonatomic) IBOutlet UIButton *preButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)preTouchEvent:(UIButton *)sender;
- (IBAction)nextTouchEvent:(UIButton *)sender;

@end

@implementation ViewController
-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    UIDeviceOrientation ori = [UIDevice currentDevice].orientation;
    //UIImageView *imgView = self.view.subviews[0];
 
    if(UIInterfaceOrientationLandscapeLeft == ori
       || UIInterfaceOrientationLandscapeRight == ori){
        //self.label.text = @"가로 상태";
        imgView.frame = CGRectMake(0, 0, 568, 320);
        self.preButton.frame = CGRectMake(20, 270, 70, 40);
        self.nextButton.frame = CGRectMake(480, 270, 70, 40);
    }
    else{
        //self.label.text = @"세로 상태";
        imgView.frame = CGRectMake(0, 0, 320, 500);
        self.preButton.frame = CGRectMake(20, 520, 70, 40);
        self.nextButton.frame = CGRectMake(230, 520, 70, 40);
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imgs = [[CarImgModel alloc] init];
    
    [imgs addImg:@"ball" withType:@".png"];
    [imgs addImg:@"축구공" withType:@".png"];
    [imgs addImg:@"moon-sky" withType:@".jpg"];
    [imgs addImg:@"야구공" withType:@".png"];
    [imgs addImg:@"윌슨" withType:@".jpg"];
    [imgs addImg:@"토끼" withType:@".jpg"];
    
    imgView = [[UIImageView alloc] initWithImage:[imgs changeImgReturn]];
    
    imgView.frame = CGRectMake(0, 0, 568, 320);
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view insertSubview:imgView atIndex:0];
    
    if(imgs.imgIndex == 0)
        self.preButton.enabled = NO;
    if(imgs.imgIndex == 2)
        self.nextButton.enabled = NO;
    imgs.imgIndex++;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)preTouchEvent:(UIButton *)sender {
    if(sender.touchInside){
        
        imgView.image = [imgs changeImgReturn];
        imgs.imgIndex--;
        if(imgs.imgIndex < 0){
            self.preButton.enabled = NO;
            imgs.imgIndex = 1;
        }
        else if(imgs.imgIndex >=0)
            self.preButton.enabled = YES;
        if(imgs.imgIndex < [imgs totalImgNum])
            self.nextButton.enabled = YES;
    }
}

- (IBAction)nextTouchEvent:(UIButton *)sender {
   if(sender.touchInside){
       imgView.image = [imgs changeImgReturn];
       imgs.imgIndex++;
       if(imgs.imgIndex >=0)
           self.preButton.enabled = YES;
       if(imgs.imgIndex >= [imgs totalImgNum] ){
           imgs.imgIndex = [imgs totalImgNum] -2;
           self.nextButton.enabled = NO;
       }
        else if(imgs.imgIndex <= [imgs totalImgNum] )
            self.nextButton.enabled = YES;
    }
}
@end
