//
//  FiveStarsView.h
//  FiveStartsViewTouch
//
//  Created by iOSGeekOfChina on 16/9/21.
//  Copyright © 2016年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FiveStarsViewDelegate <NSObject>

- (void)sendCountStars:(NSString *)number;

@end


@interface FiveStarsView : UIView


@property (nonatomic,assign) id<FiveStarsViewDelegate> delegate;

//星星高度
@property (nonatomic,assign) CGFloat imageHeight;
//星星宽度
@property (nonatomic,assign) CGFloat imageWidth;
//星星数量
@property (nonatomic,assign) NSInteger imageCount;


@end
