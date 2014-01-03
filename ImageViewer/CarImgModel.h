//
//  CarImgModel.h
//  ImageViewer
//
//  Created by SDT-1 on 2014. 1. 2..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarImgModel : NSObject
@property NSInteger imgIndex;
-(id)init;
-(void) addImg:(NSString *)name withType:(NSString *)type;
-(UIImage *) changeImgReturn;
-(NSInteger)totalImgNum;
@end
