//
//  MXMaterialAlertButton.h
//  MXSnackbar-OC-Demo
//
//  Created by Elias Abel on 2016/11/29.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MXMaterialAlertButtonTypeCustom = 0,
    MXMaterialAlertButtonTypeConfirm,
    MXMaterialAlertButtonTypeCancel,
} MXMaterialAlertButtonType;

#define MXMaterialAlertButtonTypeDefault MXMaterialAlertButtonTypeCustom;

@interface MXMaterialAlertButton : UIButton
@property (nonatomic, assign, readonly) MXMaterialAlertButtonType type;
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, copy) UIColor * _Nullable titleColor;

+ (instancetype _Nonnull)buttonForType:(MXMaterialAlertButtonType)type;
@end
