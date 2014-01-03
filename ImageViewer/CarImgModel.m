//
//  CarImgModel.m
//  ImageViewer
//
//  Created by SDT-1 on 2014. 1. 2..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CarImgModel.h"

@implementation CarImgModel{
    NSMutableArray *_imgArray;
}

-(id)init{
    self = [super init];
    if(self)
    {
        _imgArray = [[NSMutableArray alloc] init];
        self.imgIndex = 0;
    }
    return self;
}
-(void) addImg:(NSString *)name withType:(NSString *)type{
    [_imgArray addObject:[[NSBundle mainBundle] pathForResource:name ofType:type]];
    
}
-(UIImage *) changeImgReturn{
    UIImage *img = [UIImage imageWithContentsOfFile:_imgArray[self.imgIndex]];
    return img;
}

-(NSInteger)totalImgNum{
    return _imgArray.count;
}
@end
