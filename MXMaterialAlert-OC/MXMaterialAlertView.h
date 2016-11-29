//
//  MXMaterialAlertView.h
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXMaterialAlertShadowView.h"
#import "MXMaterialAlertButton.h"

typedef void (^MXMaterialAlertActionBlock) (NSString *_Nonnull buttonTitle, NSUInteger buttonIndex);

@interface MXMaterialAlertView : UIView
@property (nonatomic, strong) MXMaterialAlertShadowView * _Nonnull backgroundView;
@property (nonatomic, strong) UILabel * _Nonnull titleLabel;
@property (nonatomic, strong) UILabel * _Nonnull detailLabel;
@property (nonatomic, strong) UIView * _Nonnull buttonsContainer;
@property (nonatomic, strong) NSMutableArray <MXMaterialAlertButton *>* _Nonnull buttons;
@property (nonatomic, copy) MXMaterialAlertActionBlock _Nullable onClickListener;
- (void)updateView;
@end
