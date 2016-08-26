//
//  WTRefreshView.h
//  v2ex
//
//  Created by gengjie on 16/8/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTRefreshView : UIView

@property (nonatomic, strong) NSString *tipText;

+ (instancetype)refreshView;

- (void)startAnim;

- (void)stopAnim;

@end
