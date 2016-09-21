//
//  FiveStarsView.m
//  FiveStartsViewTouch
//
//  Created by iOSGeekOfChina on 16/9/21.
//  Copyright © 2016年 HW. All rights reserved.
//

#import "FiveStarsView.h"

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@implementation FiveStarsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (void)layoutSubviews{
    
    for (NSInteger i = 0; i < self.imageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"page_pingjia_star_default"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.tag = 1000+i;
        imageView.frame = CGRectMake(self.imageWidth*i, 0, self.imageWidth, self.imageHeight);
        [self addSubview:imageView];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint newPoint = [touch locationInView:self];
    
    NSInteger temp = ceil((newPoint.x-(SCREEN_WIDTH/2-self.imageWidth*2.5))/self.imageWidth);
    if (temp<1) {
        temp=1;
    }
    if (temp>5) {
        temp=5;
    }
    for (NSInteger i = 0; i < temp; i++) {
        UIImageView *image = (UIImageView *)[self viewWithTag:1000+i];
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        if (temp<3) {
            image.image = [UIImage imageNamed:@"page_pingjia_star_bad"];
        }else if(temp ==3){
            image.image = [UIImage imageNamed:@"page_pingjia_star_common"];
        }else{
            image.image = [UIImage imageNamed:@"page_pingjia_star_good"];
            
        }
        
    }
    
    for (NSInteger i = temp; i < 5; i++) {
        UIImageView *iamge = (UIImageView *)[self viewWithTag:1000+i];
        iamge.image = [UIImage imageNamed:@"page_pingjia_star_default"];
    }
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint newPoint = [touch locationInView:self];
    NSInteger temp = ceil((newPoint.x-(SCREEN_WIDTH/2-self.imageWidth*2.5))/self.imageWidth);
    if (temp<1) {
        temp=1;
    }
    if (temp>5) {
        temp=5;
    }
    for (NSInteger i = 0; i < temp; i++) {
        UIImageView *image = (UIImageView *)[self viewWithTag:1000+i];
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        if (temp<3) {
            image.image = [UIImage imageNamed:@"page_pingjia_star_bad"];
        }else if(temp ==3){
            image.image = [UIImage imageNamed:@"page_pingjia_star_common"];
        }else{
            image.image = [UIImage imageNamed:@"page_pingjia_star_good"];
            
        }
        
    }
    for (NSInteger i = temp; i < 5; i++) {
        UIImageView *image = (UIImageView *)[self viewWithTag:1000+i];
        image.image = [UIImage imageNamed:@"page_pingjia_star_default"];
    }
    NSInteger tempSend = ceil((newPoint.x-(SCREEN_WIDTH/2-self.imageWidth*2.5))/self.imageWidth);
    
    [self.delegate sendCountStars:[NSString stringWithFormat:@"%ld",tempSend]];
}

@end
